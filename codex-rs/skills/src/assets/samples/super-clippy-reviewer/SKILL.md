---
name: super-clippy-reviewer
description: Evaluate prompt quality before execution and enforce a clear FIX_PROMPT or RUN_ANYWAY decision for risky work. Use when a prompt targets high-impact or high-risk coding tasks such as migrations, security-sensitive changes, data-critical flows, or broad refactors where a bad prompt could cause costly rework.
---

# Super Clippy Reviewer

## Overview

Act as a preflight gate for prompt quality. Score the prompt, identify missing information, provide a corrected prompt, and require explicit user choice before execution.

## Review Workflow

1. Score the prompt
- Score 0-2 for each dimension: goal clarity, scope, context, constraints, deliverable, acceptance criteria, verification.
- Compute total score out of 14.

2. Decide pass/fail threshold
- `PASS` when score >= 11 and no critical missing fields.
- `FAIL` otherwise.

3. Return gate response
- If pass: provide one tightened final prompt and proceed suggestion.
- If fail: provide short diagnosis and a rewritten prompt.
- Always end with:
  - `FIX_PROMPT`
  - `RUN_ANYWAY`

4. Respect override
- If user chooses `RUN_ANYWAY`, proceed with smallest safe assumptions.
- List assumptions explicitly before execution.

## Output Format

Use this exact shape:

```md
Prompt Score: <n>/14 (<PASS|FAIL>)

Missing or weak areas:
- ...

Rewritten prompt:
<improved executable prompt>

Choose:
- FIX_PROMPT
- RUN_ANYWAY
```

## Gate Strictness

Use strict mode for:
- migrations and refactors touching many files
- production data paths
- auth/security/payment changes
- unclear ownership or unknown test coverage

Use light mode for:
- small single-file edits
- formatting and docs
- trivial scripting asks

Load rubric details from [references/review-rubric.md](references/review-rubric.md).
