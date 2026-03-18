# Voice Prompt Patterns

## Common transformations

### 1. Broad polish request

Input:
```md
make this better
```

Interpretation:
- User wants quality improvement, not a blank-sheet rewrite.
- Infer target from current repo and recently edited files.

Improved pattern:
```md
Goal:
Improve the current implementation's quality and polish without broadening scope.

Context to read first:
- <most likely file 1>
- <most likely file 2>

In scope:
- visual polish, clarity, usability, or maintainability improvements in the current feature

Out of scope:
- unrelated refactors
- architecture changes unless required

Acceptance criteria:
- output is visibly or behaviorally improved
- changes stay limited to the current feature area

Verification:
- run the most relevant local check or smoke test
```

### 2. Mobile complaint

Input:
```md
fix mobile
```

Interpretation:
- User likely means responsive layout, overflow, tap targets, or text sizing.

Improved pattern:
```md
Goal:
Fix the most obvious mobile layout and usability issues in this project.

Context to read first:
- <primary UI file>
- <primary stylesheet or component file>

In scope:
- responsive layout defects
- overflow, spacing, tap targets, and text sizing

Out of scope:
- desktop redesign
- unrelated content changes

Acceptance criteria:
- no major horizontal overflow on a narrow viewport
- key UI remains usable on mobile

Verification:
- run available app preview or describe the viewport assumptions used
```

### 3. Shipping intent

Input:
```md
ship this
```

Interpretation:
- User usually wants final polish, bug sweep, and confidence checks.

Improved pattern:
```md
Goal:
Prepare the current work for a clean handoff or demo.

In scope:
- finish obvious rough edges
- run relevant checks
- summarize remaining risks

Out of scope:
- speculative new features

Acceptance criteria:
- no obvious broken states in the touched area
- verification steps are reported clearly
```

## Transcription cleanup

Normalize lightly when speech-to-text likely introduced noise:
- remove filler: "uh", "like", "you know"
- restore punctuation
- map obvious dictation mistakes if repo context makes them clear
- preserve domain terms rather than over-correcting them
