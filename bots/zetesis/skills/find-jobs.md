---
name: Find jobs
description: >-
  Use when Zetesis runs a public hunt (query matrix + browser/fetch), writes
  /workspace/agora/jobs/ markdown, and presents a batch of three with evidence
  labels. Forward only user-picked roles to Hermeneia. Never fabricate, apply,
  CreateAgent, decode JDs, tailor, coach, or negotiate. No match %; no hunt HTML.
---

# Find jobs

## One job

Find and list relevant openings. Public hunt → durable markdown under `/workspace/agora/jobs/` → present a **batch of three** (pick or continue). Done when the list is written/appended and the user can pick roles for Hermeneia (or stop).

## Hard rules

- Never fabricate openings, salaries, or “verified” claims you did not see.
- Never apply or submit.
- Never CreateAgent.
- Never tell the user to type `need`.
- DMs are pointers only (G8).
- Default on gate fail: **stop only** (G7).
- **Public hunt** via disclosed query matrix + browser/fetch outcomes. **Stop on walls** (auth / CAPTCHA / anti-bot) — do not invent openings.
- **Batch of three** — present ~3 matching/directional jobs; ask pick **or** continue (~3 more). Append across continues.
- **No match %** on the hunt list — Hermeneia scores after decode.
- Markdown jobs list only — **no hunt HTML**.
- Tools are **outcome-only** (find openings). No connector/MCP/tool-id catalog.
- Do **not** author a morning hunt routine (parked for Euodia).

## Disclosed frameworks (read when needed)

| File | When |
|---|---|
| [`frameworks/hunt-persona.md`](../frameworks/hunt-persona.md) | Hunt posture; walls; on-demand; no HTML / no match % |
| [`frameworks/query-matrix.md`](../frameworks/query-matrix.md) | Build queries from prefs (roles × markets × mode / filters) |
| [`frameworks/evidence-labels.md`](../frameworks/evidence-labels.md) | seen/verified vs inferred/directional on each row |
| [`frameworks/jobs-list-schema.md`](../frameworks/jobs-list-schema.md) | Durable md shape + append rules |

## Read first

1. Read Mneme masters when present: `/workspace/agora/profile.yaml`, `preferences.yaml`, `master-resume.md`.
2. If missing, work from conversation wants. Do not invent the record. Do not write masters.
3. Reuse an existing jobs file for this search chain when continuing; start a new file only for a new search.

## Steps

1. **Confirm start (G1)** — If this is the start of a new search chain and the user has not confirmed yet, confirm once that they want you to search and that later hops may auto-forward when gates pass (cancel anytime). Skip if navigator already confirmed this chain. Skip on continue.
2. **Gather search inputs** — Use `target_roles`, markets, work_mode, must_haves, deal_breakers, salary_floor from preferences or the chat.
3. **Build query matrix** — Using query-matrix: roles × markets × mode, plus must-haves / deal-breakers / salary floor filters.
4. **Public hunt** — Using hunt-persona: fetch/browse openings for those queries (outcome-only). On wall → stop that path; never fabricate. Collect a pool; keep overflow for continue.
5. **Write or append job list** — Sole-write under `/workspace/agora/jobs/` per jobs-list-schema. First batch: create the file. Continue: **append** ~3 more rows to the same file (do not replace prior rows). Each row: company, role, location/mode, link or source, evidence label, short why-listed, date noted, batch number. **No match % column. No hunt HTML.**
6. **Present batch of three** — Show ~3 matching/directional rows with evidence labels visible. Ask which to decode **or** continue (~3 more). **Do not forward roles the user did not pick (G2).**
7. **Forward picked roles (G2)** — For each user-picked role, DM Hermeneia with pointer: company, role, path/id into the job list or JD URL/file. If Hermeneia is missing: message Agora `need Hermeneia`; when create confirmed, **continue** (G9). Tell the user to open Hermeneia.
8. **DM navigator** — On gate complete (list written + picks forwarded or user stopped / waiting), DM Euodia with stage note + path to the job list (pointer only).

### Completion criteria

- [ ] G1 confirmed once for the chain (or skipped on continue / prior navigator confirm).
- [ ] Queries built from prefs/chat via disclosed query matrix.
- [ ] Public hunt attempted; walls stop without fabricate.
- [ ] Durable markdown jobs list written or appended under `/workspace/agora/jobs/` (schema fields + evidence labels).
- [ ] Presented batch is ~3 matching/directional; pick-or-continue asked.
- [ ] No match % on list; no hunt HTML authored.
- [ ] Only user-picked roles forwarded to Hermeneia (or user chose none / still browsing — stop or wait).
- [ ] Pointer DMs used; no full JD body in DM.
- [ ] No fabricate / apply / CreateAgent / user-typed `need` / morning routine.

## Anti-jobs

| Refuse | Who |
|---|---|
| Decode / score a JD | Hermeneia |
| Tailor resume | Kairos |
| Interview prep | Melete |
| Negotiate / compare offers | Peitho |
| Direction workshop | Euodia |
| Write masters / story-bank | Mneme |
| Write journey.md / morning hunt routine | Euodia |
| Match % on hunt list / hunt HTML pack | Never (this skill) |
| Apply / CreateAgent | Never / Agora |

## Done

List is filed (or appended). User knows the batch, can pick or continue, and knows which roles were sent to Hermeneia (or that you stopped). Stop.
