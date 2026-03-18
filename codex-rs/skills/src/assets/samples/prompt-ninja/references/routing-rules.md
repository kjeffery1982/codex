# Routing Rules

## Route to Super Clippy

Use `$super-clippy` when:
- the prompt is already understandable
- the main gap is stronger structure
- the user likely benefits from tighter scope, constraints, or verification

Typical cases:
- refactor prompts
- implementation requests with weak acceptance criteria
- prompts that are "almost good"

## Route to Super Clippy Reviewer

Use `$super-clippy-reviewer` when:
- the interpreted task has meaningful downside if wrong
- the prompt lacks boundaries and the work could sprawl
- the task touches sensitive behavior or many files

Do not route ordinary UI polish, copy cleanup, or narrow bug fixes to reviewer.

## Stay Local

Do not hand off when:
- the prompt is too ambiguous to act on
- the user only needs a few clarifying questions
- the prompt is already ready

## Preferred principle

Prompt Ninja decides the lane.
Super Clippy strengthens the prompt.
Super Clippy Reviewer gates risky work.
