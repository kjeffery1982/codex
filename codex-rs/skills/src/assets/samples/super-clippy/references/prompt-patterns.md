# Prompt Patterns

## 1) Refactor With Guardrails

```md
Refactor `<module>` to improve `<goal>` without changing external behavior.

Read first:
- `<path 1>`
- `<path 2>`

Constraints:
- Keep public API unchanged.
- Touch only `<paths>`.
- Keep runtime complexity at or below current level.

Do:
1. Implement the smallest safe refactor.
2. Add or update tests covering unchanged behavior.
3. Run `<tests/lint/typecheck commands>`.

Done when:
- Existing behavior is preserved.
- Tests pass.
- Diff is limited to in-scope files.
```

## 2) Bug Fix With Minimal Patch

```md
Fix `<bug>` in `<area>`.

Read first:
- `<failing test file>`
- `<implementation file>`

Requirements:
- Reproduce failure first.
- Explain root cause in 2-4 lines.
- Apply minimal code change.
- Add regression test.

Verification:
- Run `<single test>`
- Run `<relevant suite>`
```

## 3) Legacy Modernization Pilot

```md
Modernize `<legacy flow>` with parity-first approach.

Produce/update:
- `<pilot_overview.md>`
- `<pilot_design.md>`
- `<pilot_validation.md>`
- `<openapi spec path>`
- `<parity test path>`

Requirements:
- Identify legacy sources and orchestration steps.
- Define target service/data model/API.
- Define side-by-side comparison inputs/outputs.
- Scaffold tests before full implementation.

Acceptance:
- Artifacts are internally consistent.
- Validation steps are runnable and ordered.
- Remaining risks are explicitly listed.
```

## 4) Large Task Execution Prompt

```md
Implement `<feature>` end-to-end.

Before coding:
- Confirm assumptions from code.
- Summarize plan in <=7 bullets.

Then execute:
- Make code changes directly.
- Run required checks.
- Report results with failed/pass details.

If checks fail:
- Fix issues and re-run.
- If blocked, provide smallest unblocking next step.
```

