# 01b — Hunt continue (Zetesis append)

**Bot:** Zetesis (`skills/find-jobs.md` + `frameworks/`). Follows `01-hunt.md` in the same search chain.

## Setup

`01-hunt.md` already ran. Durable list exists at `/workspace/agora/jobs/2026-10-05-search.md` with the first **batch of three** (Helios / Orbis / Redline). User has not picked yet.

## User

> Continue — show me about three more.

## Zetesis does

1. Reuse the same search chain (G1 already confirmed — do not re-confirm).
2. Hunt the next ~3 matching/directional openings via query-matrix + public hunt. Stop on walls; never fabricate.
3. **Append** only those ~3 new rows to the **same** durable markdown jobs file (append-only). Do **not** replace or delete the prior batch. Do **not** dump a larger pool.
4. Present the same new **batch of three** with evidence labels. **No match %.** **No hunt HTML.**
5. Ask again: pick for Hermeneia **or** continue. Still no forward until pick (G2).
6. **Required** — DM Euodia after this append: stage `search` + same jobs path (pointer). Not optional on continue.

## Expected append (assert)

After continue, the jobs file contains **prior rows plus ~3 new rows** (total ~6). Prior companies (Helios / Orbis / Redline) still present with `batch: 1`. New sample rows (`batch: 2`; labeled fixtures OK):

| id | company | role | mode | source | evidence | why-listed | date | batch |
|---|---|---|---|---|---|---|---|---|
| northwind-labs | Northwind Labs | Staff Platform Engineer | hybrid Berlin | sim://jobs/northwind-platform | seen | Platform IC; Berlin hybrid | 2026-10-05 | 2 |
| cobalt-systems | Cobalt Systems | Senior Backend Engineer | remote-EU | sim://jobs/cobalt-backend | directional | Title fit; JD unread | 2026-10-05 | 2 |
| meridian-cloud | Meridian Cloud | Platform Engineer | hybrid Berlin | sim://jobs/meridian-platform | seen | Platform scope match | 2026-10-05 | 2 |

## Expected DM

```
from: Zetesis
to: Euodia
type: pointer
payload:
  stage: search
  path: /workspace/agora/jobs/2026-10-05-search.md
```

## Forbidden

- Rewriting the jobs file so earlier batch rows disappear.
- Dumping more than ~3 new durable rows on this continue.
- Skipping the Euodia pointer DM after append.
- Authoring a hunt HTML report.
- Showing match % / fit % on the presented list.
- Fabricating openings when a wall blocks fetch.

## Pass hooks

- Checklist **J1** (batch ~3), **J4** (append-only continue), **J7** (Euodia pointer after append — hard FAIL if missing).
- Same path under `/workspace/agora/jobs/` grows; sole-writer still Zetesis.
- No Hermeneia forward until user picks (scenario `02-user-pick.md`).
