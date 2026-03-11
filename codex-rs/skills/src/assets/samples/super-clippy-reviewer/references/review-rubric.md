# Prompt Review Rubric

Score each dimension 0-2.

- Goal clarity
  - 0: no clear outcome
  - 1: partial outcome
  - 2: single, testable objective

- Scope boundaries
  - 0: no in/out scope
  - 1: partial boundaries
  - 2: explicit in-scope and out-of-scope

- Context specificity
  - 0: no file/module context
  - 1: vague references
  - 2: concrete files/modules to inspect first

- Constraints
  - 0: none
  - 1: generic constraints
  - 2: explicit runtime/compatibility/risk constraints

- Deliverable clarity
  - 0: unclear output
  - 1: general output
  - 2: exact expected artifact(s)

- Acceptance criteria
  - 0: none
  - 1: subjective quality criteria
  - 2: observable, objective done criteria

- Verification plan
  - 0: no checks
  - 1: checks mentioned but not executable
  - 2: concrete commands and reporting expectations

## Thresholds

- 11-14: PASS
- 8-10: FAIL (moderate)
- 0-7: FAIL (high risk)

## Critical Fails

Fail regardless of score when any of the following is missing:
- objective
- deliverable
- acceptance criteria
- verification plan for code-changing tasks
