# 01 — Hunt (Zetesis)

**Bot:** Zetesis (`skills/find-jobs.md` + `frameworks/`).

## Setup

Masters present. User wants search chain to start.

## User

> Search for Staff Platform / Senior Backend roles matching my preferences. Yes — start the chain; later hops may auto when gates pass.

## Zetesis does

1. **G1** confirm once (or accept prior navigator confirm).
2. Read masters/preferences (`target_roles`, markets, work_mode, must_haves, deal_breakers, salary_floor).
3. Build queries from disclosed **query-matrix**; run **public hunt** (browser/fetch outcome). Stop on walls (auth / CAPTCHA / anti-bot) — never fabricate openings.
4. Sole-write a durable markdown job list under `/workspace/agora/jobs/` (e.g. `jobs/2026-10-05-search.md`) per **jobs-list-schema**. **No hunt HTML.**
5. Present a **batch of three** (~3 matching/directional rows). Each row carries an **evidence label** (seen/verified or inferred/directional). **No match %** on the list — scoring is Hermeneia.
6. Ask: pick roles for Hermeneia **or** continue (~3 more). **Do not** forward until user picks (G2).
7. DM Euodia: stage note + path to job list (pointer).

## Expected batch (assert)

Exactly **~3** rows presented this turn. Sample (sim may invent labeled fixtures — not real apply):

| company | role | mode | source | evidence |
|---|---|---|---|---|
| Helios Data | Staff Platform Engineer | hybrid Berlin | sim://jobs/helios-platform | seen |
| Orbis Pay | Senior Backend Engineer | remote-EU | sim://jobs/orbis-backend | seen |
| Redline Labs | Platform Engineer | onsite Berlin | sim://jobs/redline-platform | directional |

Each durable row includes: company, role, location/mode, link or source, short why-listed, date noted, **evidence** label. Forbidden on hunt list / presentation: `match_percent`, match %, fit %, or Hermeneia-style score columns.

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

- Job list written by Zetesis only (markdown under `jobs/`).
- Checklist section **J** (hard FAIL if not ~3, missing evidence labels, match % on list, hunt HTML, or fabricate-on-wall).
- No Hermeneia forward yet.
- No fabricate unlabeled; no apply; no CreateAgent.
- Live board hunt quality remains manual.
