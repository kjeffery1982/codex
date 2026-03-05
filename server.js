import { createServer } from "node:http";
import { readFile } from "node:fs/promises";
import { extname, join, normalize } from "node:path";

const port = Number(process.env.PORT || 3000);
const staticRoot = join(process.cwd(), "appgarden-web-upload");

const mimeTypes = {
  ".css": "text/css; charset=utf-8",
  ".html": "text/html; charset=utf-8",
  ".js": "text/javascript; charset=utf-8",
  ".json": "application/json; charset=utf-8"
};

function json(res, statusCode, payload) {
  res.writeHead(statusCode, { "Content-Type": "application/json; charset=utf-8" });
  res.end(JSON.stringify(payload));
}

async function sendSlackNotification(order) {
  const webhookUrl = process.env.SLACK_WEBHOOK_URL;
  const slackBotToken = process.env.SLACK_BOT_TOKEN;
  const slackChannel = process.env.SLACK_CHANNEL || "C0AKNT94X0Q";
  const hasBotRouting = Boolean(slackBotToken);
  const hasWebhookRouting = Boolean(webhookUrl);

  if (!hasBotRouting && !hasWebhookRouting) {
    throw new Error("Missing Slack configuration: set SLACK_BOT_TOKEN (preferred) or SLACK_WEBHOOK_URL");
  }

  const itemLines = Array.isArray(order.items)
    ? order.items
        .map((item) => {
          const customization = item.customization ? ` (custom: "${item.customization}")` : "";
          return `- ${item.product} x${item.quantity} @ $${item.unitPrice}${customization}`;
        })
        .join("\n")
    : "";

  const text =
    `New purchase for Kid's Arts and Crafts\n` +
    `Product: ${order.product}\n` +
    `Price: ${order.price}\n` +
    `${order.paymentLast4 ? `Payment: Card ending ${order.paymentLast4}\n` : ""}` +
    `${itemLines ? `Items:\n${itemLines}\n` : ""}` +
    `Customer: ${order.customerName}\n` +
    `Email: ${order.customerEmail}\n` +
    `Time: ${order.purchasedAt}`;

  // Prefer bot token + channel routing; fall back to incoming webhook.
  if (hasBotRouting) {
    const response = await fetch("https://slack.com/api/chat.postMessage", {
      method: "POST",
      headers: {
        "Content-Type": "application/json; charset=utf-8",
        Authorization: `Bearer ${slackBotToken}`
      },
      body: JSON.stringify({
        channel: slackChannel,
        text
      })
    });

    if (!response.ok) {
      throw new Error(`Slack API failed with status ${response.status}`);
    }

    const payload = await response.json();
    if (!payload.ok) {
      throw new Error(`Slack API error: ${payload.error || "unknown_error"}`);
    }
    return;
  }

  const webhookResponse = await fetch(webhookUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ text })
  });

  if (!webhookResponse.ok) {
    throw new Error(`Slack webhook failed with status ${webhookResponse.status}`);
  }
}

async function serveStatic(req, res) {
  const requestPath = req.url === "/" ? "/index.html" : req.url || "/index.html";
  const normalizedPath = normalize(requestPath).replace(/^(\.\.[/\\])+/, "");
  const filePath = join(staticRoot, normalizedPath);

  try {
    const content = await readFile(filePath);
    const contentType = mimeTypes[extname(filePath)] || "application/octet-stream";
    res.writeHead(200, { "Content-Type": contentType });
    res.end(content);
  } catch {
    json(res, 404, { error: "Not found" });
  }
}

const server = createServer(async (req, res) => {
  if (req.method === "POST" && req.url === "/api/orders") {
    let rawBody = "";

    req.on("data", (chunk) => {
      rawBody += chunk;
    });

    req.on("end", async () => {
      try {
        const order = JSON.parse(rawBody);

        if (!order.product || !order.price || !order.customerName || !order.customerEmail || !order.purchasedAt) {
          json(res, 400, { error: "Missing required order fields" });
          return;
        }

        if (!/^\d{4}$/.test(String(order.paymentLast4 || ""))) {
          json(res, 400, { error: "Missing valid payment details" });
          return;
        }

        if (Array.isArray(order.items)) {
          for (const item of order.items) {
            if (!item.product || !item.quantity || !item.unitPrice) {
              json(res, 400, { error: "Missing required item fields" });
              return;
            }

            if (item.product === "Necklace") {
              const text = String(item.customization || "").trim();
              if (text.length < 1 || text.length > 25) {
                json(res, 400, { error: "Necklace customization must be between 1 and 25 characters" });
                return;
              }
            }
          }
        }

        await sendSlackNotification(order);
        json(res, 200, { ok: true });
      } catch (error) {
        json(res, 500, { error: error.message || "Order processing failed" });
      }
    });

    return;
  }

  if (req.method === "GET") {
    await serveStatic(req, res);
    return;
  }

  json(res, 405, { error: "Method not allowed" });
});

server.listen(port, () => {
  console.log(`Kid's Arts and Crafts server listening on http://localhost:${port}`);
});
