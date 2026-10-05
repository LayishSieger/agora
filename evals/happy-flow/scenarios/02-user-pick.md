# 02 — User pick (G2)

**Bot:** Zetesis (continue) → Hermeneia seated.

## User

> Decode Helios Data — Staff Platform Engineer. Skip the others for now.

## Zetesis does

1. Forward **only** the picked role (G2).
2. DM Hermeneia: company, role, path/id into job list (or JD URL).
3. If Hermeneia missing: Agora `need Hermeneia`; continue when confirmed. Tell user to open Hermeneia — never tell them to type `need`.

## Expected DM

```
from: Zetesis
to: Hermeneia
type: pointer
payload:
  company: Helios Data
  role: Staff Platform Engineer
  path: /workspace/agora/jobs/2026-10-05-search.md#helios-data
```

## Pass hooks

- Orbis / Redline **not** forwarded.
- Pointer only — no full JD in DM.
