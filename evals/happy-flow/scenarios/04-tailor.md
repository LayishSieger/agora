# 04 — Tailor + G4 stop (Kairos)

**Bot:** Kairos (`skills/tailor-resume.md`).

## Read

jd-bank entry + masters.

## Kairos does

1. Write `/workspace/agora/applications/resume_helios-data_staff-platform-engineer.md`.
2. Write matching `.html` loader (simple).
3. Tell user: paths written; **fleet never applies**; Melete after apply-commit via user or Euodia.
4. DM Euodia: tailor complete / awaiting apply (pointer).
5. **Do not** DM Melete (G4).

## Expected DM

```
from: Kairos
to: Euodia
type: pointer
payload:
  stage: tailor
  company: Helios Data
  role: Staff Platform Engineer
  path: /workspace/agora/applications/resume_helios-data_staff-platform-engineer.md
  status: awaiting_apply
```

## Forbidden

```
from: Kairos
to: Melete
# MUST NOT appear on tailor complete
```

## Pass hooks

- Applications sole-written by Kairos.
- No Melete DM.
- No apply / CreateAgent / master mutation.
