# 00 — Direction → Mneme

**Bot:** Euodia (`skills/clarify-direction.md`) then Mneme (`skills/curate-master-career-files.md`).

## Setup

Fixtures already have masters. Treat wants as confirmed (or re-confirm lightly).

## User

> I want Staff Platform / Senior Backend in Berlin or remote-EU, hybrid OK. Floor EUR 110k. Emphasize platforms and reliability.

## Euodia does

1. Read back wants as a proposal (preferences keys only).
2. On user yes: **DM Mneme** with agreed wants keys (pointer — not a full resume).
3. Does **not** write `preferences.yaml` / masters / journey (direction skill does not write files).

## Mneme does

1. Read back the patch.
2. On confirm: update `preferences.yaml` (and leave profile/master-resume unless intake asked).
3. Does not search, score, or tailor.

## Expected DM (pointer)

```
from: Euodia
to: Mneme
type: pointer
payload:
  ask: persist preferences
  keys: [target_roles, markets, work_mode, salary_floor, emphasize]
```

## Pass hooks

- Euodia did not write career files.
- Mneme sole-wrote preferences (if changed).
- No CreateAgent / apply / user-typed `need`.
