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
4. Sole-write a durable markdown job list under `/workspace/agora/jobs/` (e.g. `jobs/2026-10-05-search.md`) per **jobs-list-schema** — **only** the ~3 rows for this batch (not the full hunt pool). **No hunt HTML.**
5. Present that same **batch of three** (~3 matching/directional rows). Each row carries an **evidence label** (seen/verified or inferred/directional). **No match %** on the list — scoring is Hermeneia.
6. Ask: pick roles for Hermeneia **or** continue (~3 more). **Do not** forward until user picks (G2).
7. **After hunt write** — **Required** DM Euodia: stage note + path to job list (pointer). Do this before waiting forever on pick; not only after Hermeneia forward.

## Expected batch (assert)

Exactly **~3** rows presented this turn. Sample durable table (sim may invent labeled fixtures — not real apply):

| id | company | role | mode | source | evidence | why-listed | date | batch |
|---|---|---|---|---|---|---|---|---|
| helios-data | Helios Data | Staff Platform Engineer | hybrid Berlin | sim://jobs/helios-platform | seen | Platform IC; Berlin hybrid | 2026-10-05 | 1 |
| orbis-pay | Orbis Pay | Senior Backend Engineer | remote-EU | sim://jobs/orbis-backend | seen | Backend + payments domain | 2026-10-05 | 1 |
| redline-labs | Redline Labs | Platform Engineer | onsite Berlin | sim://jobs/redline-platform | directional | Title fit; JD body unread | 2026-10-05 | 1 |

Each durable row includes schema columns (`id`, company, role, mode, source, evidence, why-listed, date, `batch`). Forbidden on hunt list / presentation: `match_percent`, match %, fit %, or Hermeneia-style score columns.

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

- Job list written by Zetesis only (markdown under `jobs/`); durable rows this turn = presented ~3.
- Checklist section **J** (hard FAIL if not ~3 / pool dump, missing evidence labels, match % on list, hunt HTML, fabricate-on-wall, or missing Euodia pointer — **J7**).
- No Hermeneia forward yet.
- No fabricate unlabeled; no apply; no CreateAgent.
- Live board hunt quality remains manual.
