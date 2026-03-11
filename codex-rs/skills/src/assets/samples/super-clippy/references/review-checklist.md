# Prompt Review Checklist

Use before sending a prompt to Codex.

- Objective is one sentence and testable.
- Deliverable is explicit (code patch, docs, tests, plan, or review).
- Files/modules to read first are listed with paths.
- In-scope and out-of-scope boundaries are explicit.
- Non-negotiable constraints are listed.
- Verification commands are specified.
- Acceptance criteria are observable and concrete.
- Fallback behavior is defined if blocked.

## Fast Upgrades

If your prompt feels weak, add these in order:

1. Add exact files and commands.
2. Add measurable acceptance criteria.
3. Add explicit exclusions to prevent scope drift.
4. Ask for smallest safe change first.
5. Require pass/fail verification output.

