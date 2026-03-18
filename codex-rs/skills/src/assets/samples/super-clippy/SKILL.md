---
name: super-clippy
description: Strengthen already-usable prompts into high-signal Codex prompts with better scope, constraints, acceptance criteria, and verification. Use when a prompt is understandable but loose, when a user asks for better prompts or stronger agent instructions, or when Prompt Ninja decides the request is usable and should be tightened rather than clarified.
---

# Super Clippy

## Overview

Turn rough asks into prompts Codex can execute with minimal ambiguity. Optimize for concrete scope, constraints, acceptance checks, and verification loops.

## Workflow

1. Extract objective and output
- Restate the task as a deliverable with a clear endpoint.
- Choose one primary output format: patch, PR-ready diff, plan, report, or checklist.

2. Bound scope and risk
- Declare in-scope files, systems, and environments.
- Declare out-of-scope areas to prevent drift.
- Capture non-negotiable constraints (runtime, compatibility, policy, deadlines).

3. Add repository-grounded context
- Name exact files, modules, and interfaces Codex must read first.
- Require Codex to confirm assumptions from code before implementing.
- Prefer short references over long prose.

4. Define execution contract
- Require implementation, not only analysis, unless explicitly requested.
- Specify required tooling behavior (tests, lint, type-check, migration dry-run).
- Require progress updates at meaningful milestones for long tasks.

5. Define acceptance and evidence
- Add explicit done criteria tied to behavior.
- Require verification commands and expected outcomes.
- Require listing known risks or open questions if full verification is blocked.

6. Add iteration loop
- Ask for smallest safe change first.
- If failing, ask for root cause plus minimal follow-up patch.
- Keep each iteration tied to measurable acceptance criteria.

## Prompt Template

Use this template and fill all placeholders:

```md
Goal:
<one sentence outcome>

Context to read first:
- <absolute path/file 1>
- <absolute path/file 2>

In scope:
- <components/files/workflows>

Out of scope:
- <explicit exclusions>

Constraints:
- <versions/platform/perf/security/deadline constraints>

Deliverable:
- <exact output: code changes + tests + docs, or plan only>

Implementation requirements:
- <required architecture or patterns>
- <required commands to run>

Acceptance criteria:
- <observable behavior 1>
- <observable behavior 2>

Verification:
- Run: `<command 1>`
- Run: `<command 2>`
- Report: pass/fail + key output lines

If blocked:
- State blocker, attempted mitigation, and smallest next action.
```

## Modernization Mode

For legacy modernization or migration work, require:
- Baseline behavior description before edits.
- Parity strategy (inputs, outputs, comparator, tolerance rules).
- Incremental phases with artifacts (overview, design, validation, implementation).
- Traceability from modern code paths back to legacy behavior.

Load focused examples from [references/prompt-patterns.md](references/prompt-patterns.md) and [references/review-checklist.md](references/review-checklist.md).

## Output Style

- Keep rewritten prompts concise and directly executable.
- Prefer concrete nouns over abstract guidance.
- Remove motivational language and policy boilerplate unless required.
- End with a short "Why this is better" note in 3 bullets max.
