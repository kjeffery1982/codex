# Classification Examples

## Rewrite

Input:
```md
make this pop and fix mobile
```

Expected:
- classification: `messy`
- action: `Rewrite`
- route: none unless risk emerges from inferred task

## Clarify

Input:
```md
fix chapter 3
```

Expected:
- classification: `ambiguous`
- action: `Clarify`
- ask which artifact "chapter 3" refers to and what outcome is desired

## Hand off

Input:
```md
Refactor the reporting job to be easier to test without changing behavior.
```

Expected:
- classification: `usable`
- action: `Hand off`
- route to `$super-clippy`

## Ready

Input:
```md
Goal: Fix mobile overflow in the lemonade flyer.
Context to read first:
- /Users/kj/Documents/Codex projects/jeffrey-family-lemonade/index.html
- /Users/kj/Documents/Codex projects/jeffrey-family-lemonade/styles.css
In scope:
- responsive layout fixes for widths 320px to 430px
Out of scope:
- desktop redesign
Acceptance criteria:
- no horizontal scroll on narrow mobile widths
Verification:
- inspect mobile layout at 320px and 390px
```

Expected:
- classification: `ready`
- action: `Ready`
- keep changes minimal
