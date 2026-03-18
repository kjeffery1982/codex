---
name: voice-prompt-coach
description: Compatibility shim for voice-style prompt handling. Use when a user explicitly asks for voice prompt coaching or when older rules still reference this skill; interpret spoken or fragmentary prompts, then follow Prompt Ninja semantics to classify, improve, and route the prompt without maintaining separate logic.
---

# Voice Prompt Coach

## Overview

Keep older voice-first workflows working while Prompt Ninja becomes the real front door. This skill should behave as a thin alias, not a second independent prompt router.

## Compatibility Behavior

1. Detect voice-style input
- Recognize dictated, fragmentary, or spoken phrasing.
- Normalize filler words and obvious transcription noise.

2. Delegate conceptually to Prompt Ninja
- Follow the same classification model:
  - `messy`
  - `usable`
  - `ambiguous`
  - `ready`
- Use the same action model:
  - `Rewrite`
  - `Clarify`
  - `Hand off`
  - `Ready`

3. Route the next step
- Use `$super-clippy` for prompt strengthening.
- Use `$super-clippy-reviewer` only for risky tasks.
- Do not maintain a separate routing policy here.

## Output Contract

Use the same output shape as Prompt Ninja wherever possible so users see one consistent pattern.

## Scope Boundary

Do not evolve this skill into a separate logic owner. Prompt Ninja is the canonical front door; this skill exists only so existing references and habits still work.
