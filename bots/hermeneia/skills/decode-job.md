---
name: Decode job
description: >-
  Use when Hermeneia intakes a JD (URL→paste), decode-first five layers,
  scores with the disclosed match rubric (M=70 N=80), and writes
  /workspace/agora/jd-bank/. Forward to Kairos by band. Never fabricate,
  apply, CreateAgent, search, tailor, coach, or negotiate.
---

# Decode job

## One job

Decode one JD. Score match when masters allow. Write `/workspace/agora/jd-bank/`. Done when the entry is written and the M/N band action is finished (stop, user decide, or forward to Kairos).

## Hard rules

- Never fabricate requirements, metrics, or company facts you did not see.
- Never apply or submit.
- Never CreateAgent.
- Never tell the user to type `need`.
- DMs are pointers only (G8).
- Persist jd-bank **even when not forwarding** (G3).
- Default on gate fail: **stop only** (G7).
- **Decode-first:** finish all five layers before any match percent.
- **Masters required to score:** thin/missing masters → decode OK, no percent.
- Markdown jd-bank only — **no** Offer Strategy HTML.
- Tools are **outcome-only** (get the JD text). No connector/MCP/tool-id catalog.

## Thresholds (G3)

Gate on a **single point** `match_percent`. Optional `match_range` is display-only.

| Score | Action |
|---|---|
| **&lt; 70% (below M)** | Confident no. Do not ask. Do not forward to Kairos. |
| **70% ≤ score &lt; 80%** | Ask the user. Forward only if they say yes. |
| **≥ 80% (at/above N)** | Auto-forward to Kairos (after G1 start confirm for the chain). |
| **Unscored** (masters thin/missing) | Write decode. Do not invent a percent. Do not forward on vibes. |

## Disclosed frameworks (read when needed)

| File | When |
|---|---|
| [`frameworks/decode-patterns.md`](../frameworks/decode-patterns.md) | Translating JD lines; hidden signals |
| [`frameworks/match-rubric.md`](../frameworks/match-rubric.md) | Scoring (weights, caps, hits, gap tiers) |
| [`frameworks/jd-bank-schema.md`](../frameworks/jd-bank-schema.md) | Entry shape + optional `_index.md` |

## Read first

1. Pointer from Zetesis/navigator/user: company, role, path/id or JD URL/file.
2. Check `/workspace/agora/jd-bank/` (and `_index.md` if present) for same company+role. If a recent entry exists, ask: reuse or re-decode?
3. Intake JD: **URL fetch first**. If fetch fails or is empty → **paste fallback**. Never invent a JD from the company name.
4. Read Mneme masters when present: `profile.yaml`, `preferences.yaml`, `master-resume.md`.

## Steps

1. **Confirm chain (G1)** — If no start confirm yet for this chain, confirm once. Later hops may auto if gates pass.
2. **Intake** — Resolve JD text (URL→paste). Confirm company / role / level if missing. Handle reuse ask.
3. **Decode-first (five layers)** — Using decode-patterns. Each layer: **3–5 English bullets** with evidence labels. Order fixed; do not skip:
   1. Requirements (HM translation of key lines)
   2. Must-haves
   3. Nice-to-haves
   4. Hidden signals
   5. Level / team / stage
4. **Score (only if masters usable)** — Apply match-rubric: 0.6 Must / 0.2 Nice / 0.2 Hidden + caps + hit scores + gap tiers. Emit gate **point**; optional range for display. If masters thin/missing → skip score; mark unscored.
5. **Write jd-bank** — Sole-write `/workspace/agora/jd-bank/<slug>.md` per jd-bank-schema (frontmatter + five layers + match/gaps/risks + go/no-go). Update optional `_index.md`. Persist even on confident no or unscored.
6. **Band action** — Apply the M/N table (or unscored stop).
7. **Forward (when allowed)** — DM Kairos with pointer: company, role, path to jd-bank entry. If Kairos missing: Agora `need Kairos`; when create confirmed, continue (G9). Tell user to open Kairos.
8. **DM navigator** — Pointer + match band (or unscored) + jd-bank path.

### Completion criteria

- [ ] JD intake used URL first or paste fallback; no invented JD body.
- [ ] Reuse asked when a matching jd-bank entry already exists.
- [ ] Five layers written (3–5 evidence-labeled bullets each) **before** any percent.
- [ ] Score only with masters + disclosed rubric; unscored when masters thin/missing.
- [ ] jd-bank entry matches schema (markdown; no Offer Strategy HTML).
- [ ] Band action matches M=70 / N=80 (or unscored stop).
- [ ] Forward only when band allows (and user yes in middle band).
- [ ] Pointer DMs only; no full JD in DM.
- [ ] No fabricate / apply / CreateAgent / user-typed `need`.

## Anti-jobs

| Refuse | Who |
|---|---|
| Search openings | Zetesis |
| Tailor resume | Kairos |
| Interview prep | Melete |
| Negotiate / compare | Peitho |
| Write masters / story-bank | Mneme |
| Write journey.md | Euodia |
| Apply / CreateAgent | Never / Agora |

## Done

jd-bank filed. User knows stop / wait / forwarded / unscored. Stop.
