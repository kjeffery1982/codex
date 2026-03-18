# Handoff Rules

## When to use Super Clippy

Use `$super-clippy` for almost every voice-style prompt after interpretation.

Reason:
- voice prompts usually omit scope
- users rarely name files
- success criteria are usually implied, not stated

## When to use Super Clippy Reviewer

Use `$super-clippy-reviewer` only when the interpreted request implies:
- auth, security, billing, payment, or sensitive data changes
- multi-file migrations or refactors
- runtime, deployment, or infrastructure risk
- unclear impact radius with weak local signals

## Preferred behavior

Do not respond with only:
- "this prompt is vague"
- "please be more specific"

Instead:
1. infer likely intent
2. propose a concrete improved prompt
3. state assumptions
4. escalate to reviewer only if the inferred task is risky

## Short example

Input:
```md
the nav is weird on phones
```

Bad response:
- asks for exact file, browser, and screenshot before doing anything

Preferred response:
- interpret as mobile nav bug
- inspect likely nav and style files first
- produce improved prompt
- proceed in coach mode unless the app structure makes the fix risky
