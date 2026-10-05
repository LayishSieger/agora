# 06 — Navigate (Euodia)

**Bot:** Euodia (`skills/navigate-progress.md`).

## Trigger

Stage DMs: search done, decode forwarded, tailor awaiting apply → then user apply-commit.

## Euodia does

1. Sole-write `/workspace/agora/journey.md` — stage `applied` (then `interview` when Melete seated).
2. Seat Melete with pointer: company, role, path to `applications/resume_*`.
3. If Melete missing: Agora `need Melete`; continue when confirmed. Tell user to open Melete.
4. Does not tailor, decode, or coach in this chat.
5. After apply-commit: note daily-check routine ownership (Gmail connect ask only if not connected — do not invent OAuth).

## Expected journey snippet

```markdown
- updated: <ISO-8601>
- stage: applied
- company: Helios Data
- role: Staff Platform Engineer
- paths:
  - jobs: /workspace/agora/jobs/2026-10-05-search.md
  - jd: /workspace/agora/jd-bank/helios-data-staff-platform.md
  - resume: /workspace/agora/applications/resume_helios-data_staff-platform-engineer.md
  - offer:
  - deal:
- notes: User apply-commit recorded; seating Melete
```

## Expected DM

```
from: Euodia
to: Melete
type: pointer
payload:
  company: Helios Data
  role: Staff Platform Engineer
  path: /workspace/agora/applications/resume_helios-data_staff-platform-engineer.md
  stage: post_apply
```

## Pass hooks

- Only Euodia wrote journey.md.
- Pointer DM to Melete after apply — not before.
- No CreateAgent by Euodia; no apply.
