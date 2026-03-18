---
name: prompt-ninja
description: Classify and improve prompts before Codex executes them. Use when a prompt is messy, dictated, broad, multi-tasked, usable-but-loose, or when the user asks whether a prompt is ready; choose between Rewrite, Clarify, Hand off, or Ready, improve the prompt with Super Clippy when appropriate, and invoke Super Clippy Reviewer only for high-risk work.
---

# Prompt Ninja

## Overview

Act as the front door for prompt quality work. Classify the incoming prompt, decide the next action, and always provide a concrete improvement path instead of only criticizing the prompt.

## Workflow

1. Classify the prompt
- Choose one class:
  - `messy`
  - `usable`
  - `ambiguous`
  - `ready`
- Base classification on structure, completeness, scope clarity, and execution readiness.

2. Choose the action
- `messy` -> `Rewrite`
- `ambiguous` -> `Clarify`
- `usable` -> `Hand off` or light tightening
- `ready` -> `Ready`

3. Improve, do not just critique
- Always provide one of:
  - a rewritten prompt
  - up to 3 sharp clarification questions
  - a handoff recommendation to `$super-clippy`
  - a ready-to-run confirmation with only minimal tightening
- Do not stop at "this is vague" or "needs work."

4. Route to the right next step
- Use `$super-clippy` when the prompt is already mostly workable but needs stronger scope, constraints, acceptance criteria, or verification.
- Use `$super-clippy-reviewer` only when the interpreted task is high-risk:
  - migrations or broad refactors
  - auth, security, billing, or data-critical changes
  - unclear impact radius across many files
  - runtime, deployment, or infrastructure risk

5. Preserve trust
- Do not invent facts.
- State assumptions briefly when inferring likely context.
- Prefer the smallest plausible scope when the prompt is loose.

## Classification Guide

### `messy`
- dictated or fragmentary
- broad ask with little structure
- mixed ideas in one breath
- examples:
  - "make this pop and fix mobile"
  - "clean this up and ship it"

Action:
- rewrite into an execution-ready prompt

### `ambiguous`
- missing critical target, outcome, or constraints
- multiple plausible interpretations with material differences
- examples:
  - "fix chapter 3"
  - "update the model stuff"

Action:
- ask up to 3 concise questions that materially change the work

### `usable`
- clear enough to understand intent
- still missing boundaries, verification, or stronger wording
- examples:
  - "Refactor the reporting job to be easier to test"

Action:
- lightly tighten or hand off to `$super-clippy`

### `ready`
- already scoped, testable, and execution-ready
- examples:
  - prompt already contains goal, files, constraints, deliverable, and verification

Action:
- say it is ready and avoid over-rewriting

## Output Contract

Use this exact structure:

```md
Original prompt:
<verbatim>

Classification:
<messy|usable|ambiguous|ready>

Recommended action:
<Rewrite|Clarify|Hand off|Ready>

Interpreted intent:
- <goal>
- <likely target area>
- <assumptions if any>

Response:
<rewritten prompt OR clarification questions OR handoff note OR ready confirmation>

Routing:
- <none|super-clippy|super-clippy-reviewer>
- <why>

Change summary:
- <what was improved or why it is already ready>
```

## Handoff Rules

- If the prompt is `usable`, prefer handing off to `$super-clippy` rather than duplicating all of its tightening logic.
- If the prompt is `messy` but low-risk, rewrite directly and keep momentum.
- If the prompt is `ambiguous`, ask sharp questions before routing.
- If the prompt is `ready`, do not manufacture extra process.

Load concrete examples and edge cases from [references/classification-examples.md](references/classification-examples.md) and [references/routing-rules.md](references/routing-rules.md).
