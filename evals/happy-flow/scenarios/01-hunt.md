# 01 — Hunt (Zetesis)

**Bot:** Zetesis (`skills/find-jobs.md`).

## Setup

Masters present. User wants search chain to start.

## User

> Search for Staff Platform / Senior Backend roles matching my preferences. Yes — start the chain; later hops may auto when gates pass.

## Zetesis does

1. **G1** confirm once (or accept prior navigator confirm).
2. Read masters/preferences.
3. Sole-write a job list under `/workspace/agora/jobs/` (e.g. `jobs/2026-10-05-search.md`).
4. Present list. **Do not** forward until user picks (G2).
5. DM Euodia: stage note + path to job list (pointer).

## Sample rows (sim may invent labeled “seen” fixtures — not real apply)

| company | role | mode | source |
|---|---|---|---|
| Helios Data | Staff Platform Engineer | hybrid Berlin | sim://jobs/helios-platform |
| Orbis Pay | Senior Backend Engineer | remote-EU | sim://jobs/orbis-backend |
| Redline Labs | Platform Engineer | onsite Berlin | sim://jobs/redline-platform |

## Expected DM

```
from: Zetesis
to: Euodia
type: pointer
payload:
  stage: search
  path: /workspace/agora/jobs/2026-10-05-search.md
```

## Pass hooks

- Job list written by Zetesis only.
- No Hermeneia forward yet.
- No fabricate unlabeled; no apply; no CreateAgent.
