from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.pagesizes import letter
from reportlab.lib.units import inch
from reportlab.pdfgen import canvas


ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "output" / "pdf"
OUTPUT.mkdir(parents=True, exist_ok=True)

PDF_PATH = OUTPUT / "jeffery-family-lemonade-community-one-pager.pdf"
QR_PATH = ROOT / "qr-code.png"
MAP_PATH = ROOT / "google-maps-poster-area.png"
DOWNLOAD_COPY = Path("/Users/kj/Downloads/jeffery-family-lemonade-community-one-pager.pdf")

PAGE_W, PAGE_H = letter
MARGIN = 0.35 * inch

GREEN = colors.HexColor("#35a926")
GREEN_DARK = colors.HexColor("#27831c")
YELLOW = colors.HexColor("#ffe84a")
YELLOW_DEEP = colors.HexColor("#ffc928")
ORANGE = colors.HexColor("#cf8920")
WOOD = colors.HexColor("#b77421")
WOOD_DARK = colors.HexColor("#8e5818")
PAPER = colors.HexColor("#fffdf7")
INK = colors.HexColor("#21440f")


def center_text(c, text, y, font, size, fill, stroke=None, stroke_width=1):
    c.setFont(font, size)
    if stroke:
        c.setFillColor(stroke)
        for dx, dy in [(-stroke_width, 0), (stroke_width, 0), (0, -stroke_width), (0, stroke_width)]:
            c.drawCentredString(PAGE_W / 2 + dx, y + dy, text)
    c.setFillColor(fill)
    c.drawCentredString(PAGE_W / 2, y, text)


def draw_drink(c, x, y, flip=False):
    c.saveState()
    if flip:
        c.translate(x + 90, y)
        c.scale(-1, 1)
        x = 0
    c.setStrokeColor(colors.Color(0.21, 0.66, 0.15, alpha=0.9))
    c.setLineWidth(3)
    c.setFillColor(colors.Color(1, 1, 1, alpha=0.18))
    c.roundRect(x, y, 72, 100, 14, fill=1, stroke=1)
    c.setFillColor(colors.HexColor("#ffe768"))
    c.roundRect(x + 6, y + 8, 60, 54, 10, fill=1, stroke=0)
    c.setStrokeColor(GREEN)
    c.setLineWidth(5)
    c.line(x + 22, y + 106, x + 12, y + 148)
    c.setStrokeColor(colors.Color(1, 1, 1, alpha=0.5))
    c.setFillColor(colors.Color(1, 1, 1, alpha=0.4))
    for px, py in [(x + 18, y + 20), (x + 34, y + 28), (x + 48, y + 18)]:
        c.roundRect(px, py, 10, 10, 2, fill=1, stroke=1)
    c.setFillColor(colors.HexColor("#ffd11f"))
    c.setStrokeColor(colors.HexColor("#ffd11f"))
    c.circle(x + 60, y + 95, 16, fill=1, stroke=1)
    c.setStrokeColor(colors.HexColor("#fff9de"))
    c.circle(x + 60, y + 95, 8, fill=0, stroke=1)
    c.restoreState()


def draw_lemon(c, x, y):
    c.setFillColor(colors.HexColor("#ffd91b"))
    c.setStrokeColor(colors.HexColor("#e7bc0a"))
    c.setLineWidth(3)
    c.circle(x, y, 32, fill=1, stroke=1)
    c.setFillColor(colors.HexColor("#51341b"))
    c.circle(x - 10, y + 6, 2.5, fill=1, stroke=0)
    c.circle(x + 10, y + 6, 2.5, fill=1, stroke=0)
    c.arc(x - 10, y - 8, x + 10, y + 2, startAng=200, extent=140)


def draw_stand(c, x, y):
    awning_w = 250
    awning_h = 48
    stripe_w = awning_w / 6
    for i in range(6):
        c.setFillColor(GREEN if i % 2 == 0 else YELLOW)
        c.setStrokeColor(GREEN_DARK)
        c.setLineWidth(2)
        c.rect(x + i * stripe_w, y + 102, stripe_w, awning_h, fill=1, stroke=1)
    c.roundRect(x, y + 102, awning_w, awning_h, 10, fill=0, stroke=1)

    c.setFillColor(WOOD_DARK)
    c.rect(x + 24, y + 28, 8, 80, fill=1, stroke=0)
    c.rect(x + awning_w - 32, y + 28, 8, 80, fill=1, stroke=0)

    c.setFillColor(WOOD)
    c.setStrokeColor(WOOD_DARK)
    c.setLineWidth(3)
    c.rect(x + 18, y + 34, awning_w - 36, 48, fill=1, stroke=1)
    c.rect(x + 10, y + 78, awning_w - 20, 12, fill=1, stroke=1)

    # Pitcher
    c.setStrokeColor(colors.Color(0.21, 0.66, 0.15, alpha=0.6))
    c.setFillColor(colors.Color(1, 1, 1, alpha=0.55))
    c.roundRect(x + 54, y + 44, 42, 50, 10, fill=1, stroke=1)
    c.setFillColor(colors.HexColor("#ffe768"))
    c.roundRect(x + 58, y + 48, 34, 24, 8, fill=1, stroke=0)
    c.setStrokeColor(colors.Color(0.21, 0.66, 0.15, alpha=0.6))
    c.arc(x + 92, y + 54, x + 112, y + 82, startAng=270, extent=180)

    # Cups
    for i, h in enumerate([30, 38, 46]):
        cx = x + 132 + i * 28
        c.setFillColor(colors.Color(1, 1, 1, alpha=0.55))
        c.setStrokeColor(colors.Color(0.21, 0.66, 0.15, alpha=0.6))
        c.roundRect(cx, y + 44, 22, h, 6, fill=1, stroke=1)
        c.setFillColor(colors.HexColor("#ffe768"))
        c.roundRect(cx + 3, y + 47, 16, max(14, h - 18), 4, fill=1, stroke=0)

    # Sign
    c.setFillColor(YELLOW)
    c.setStrokeColor(WOOD_DARK)
    c.setLineWidth(3)
    c.rect(x + 45, y, awning_w - 90, 30, fill=1, stroke=1)
    c.setFillColor(GREEN_DARK)
    c.setFont("Helvetica-Bold", 20)
    c.drawCentredString(x + awning_w / 2, y + 8, "LEMONADE")


def build_pdf():
    c = canvas.Canvas(str(PDF_PATH), pagesize=letter)
    c.setTitle("Jeffery Family Lemonade Community Poster")

    c.setFillColor(PAPER)
    c.rect(0, 0, PAGE_W, PAGE_H, fill=1, stroke=0)

    draw_drink(c, 54, 638, flip=False)
    draw_drink(c, PAGE_W - 144, 638, flip=True)
    draw_lemon(c, 104, 548)
    draw_lemon(c, PAGE_W - 104, 548)

    center_text(c, "JEFFERY FAMILY", 724, "Helvetica-Bold", 18, GREEN_DARK)
    center_text(c, "LEMONADE", 672, "Helvetica-Bold", 44, YELLOW, stroke=GREEN_DARK, stroke_width=2.5)

    draw_stand(c, (PAGE_W - 250) / 2, 470)

    center_text(c, "STAND", 430, "Helvetica-Bold", 40, GREEN)
    center_text(c, "SATURDAY, MARCH 21, 2026", 388, "Helvetica-Bold", 28, YELLOW_DEEP, stroke=WOOD_DARK, stroke_width=1.4)
    center_text(c, "NOON - 3:00 PM", 360, "Helvetica-Bold", 22, WOOD_DARK)
    center_text(c, "CORNER OF BLACKBURN + MARMONA, MENLO PARK", 324, "Helvetica-Bold", 19, GREEN)

    c.setFillColor(colors.Color(1, 0.97, 0.75))
    c.setStrokeColor(colors.Color(0.82, 0.54, 0.13))
    c.setLineWidth(2)
    c.roundRect(94, 286, PAGE_W - 188, 28, 12, fill=1, stroke=1)
    c.setFillColor(ORANGE)
    c.setFont("Helvetica-Bold", 12)
    c.drawCentredString(PAGE_W / 2, 295, "CLASSIC SUNSHINE • BERRY BLUSH • FROZEN LEMONADE")

    # Bottom band
    map_x, map_y, map_w, map_h = 50, 58, 360, 210
    qr_x, qr_y, qr_w, qr_h = 430, 58, 132, 210

    c.setFillColor(colors.white)
    c.setStrokeColor(GREEN_DARK)
    c.setLineWidth(3)
    c.roundRect(map_x, map_y, map_w, map_h, 14, fill=1, stroke=1)
    c.roundRect(qr_x, qr_y, qr_w, qr_h, 14, fill=1, stroke=1)

    c.setFillColor(GREEN_DARK)
    c.setFont("Helvetica-Bold", 12)
    c.drawString(map_x + 12, map_y + map_h - 18, "FIND US NEAR WILLOWS MARKET")
    c.drawImage(str(MAP_PATH), map_x + 12, map_y + 34, map_w - 24, 150, mask="auto")

    c.setFillColor(ORANGE)
    c.setFont("Helvetica-Bold", 11)
    c.drawString(map_x + 12, map_y + 16, "Pin marks Blackburn + Marmona.")

    c.drawImage(str(QR_PATH), qr_x + 12, qr_y + 70, qr_w - 24, qr_w - 24, mask="auto")
    c.setFillColor(GREEN_DARK)
    c.setFont("Helvetica-Bold", 12)
    c.drawCentredString(qr_x + qr_w / 2, qr_y + 52, "SCAN FOR SITE")
    c.setFillColor(ORANGE)
    c.setFont("Helvetica-Bold", 11)
    c.drawCentredString(qr_x + qr_w / 2, qr_y + 18, "Menu + directions")

    c.showPage()
    c.save()

    DOWNLOAD_COPY.write_bytes(PDF_PATH.read_bytes())


if __name__ == "__main__":
    build_pdf()
    print(PDF_PATH)
