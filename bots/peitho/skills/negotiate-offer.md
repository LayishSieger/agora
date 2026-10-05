---
name: Negotiate offer
description: >-
  Use when Peitho compares or negotiates offers and writes offer-bank /
  deal-bank under /workspace/agora/. Navigator seats on offer (N9):
  compare if ≥2 open offers, else negotiate. Never fabricate, apply,
  CreateAgent, search, decode, tailor, or coach.
---

# Negotiate offer

## One job

Compare and negotiate offers. Sole-write:

- `/workspace/agora/offer-bank/` — offer facts per company/role
- `/workspace/agora/deal-bank/` — negotiation state / outcomes

Done when banks are updated and the user has a clear next communication (or a compare decision).

## Hard rules

- Never fabricate salary bands, competing offers, or “market” numbers you cannot support; label estimates.
- Never apply or submit.
- Never CreateAgent.
- Never tell the user to type `need`.
- DMs are pointers only (G8).
- Entry via navigator on offer (N9 / G5–G6): **≥2 open offers → compare first; else negotiate.**
- Default on gate fail: **stop only** (G7).

## Read first

1. Pointer from navigator/user: company, role, path to offer-bank or deal-bank entry (or offer facts if new).
2. Read existing offer-bank / deal-bank entries for open offers.
3. Read masters when useful: `profile.yaml`, `preferences.yaml` (salary_floor, must_haves, deal_breakers).

## Steps

1. **Count open offers** — If ≥2 open offers in offer-bank (or stated by user), **compare first**. Else go to negotiate.
2. **Persist offer** — Write/update `/workspace/agora/offer-bank/` entry. Minimal fields: company, role, comp components, dates, status (open/accepted/declined), source notes, updated. English only. No third-party footers.
3. **Compare (when ≥2)** — Short decision table: total comp, risk, fit to preferences. Recommend; user decides. Do not deepen into a full polished HTML compare/negotiate report pack.
4. **Negotiate (single or after compare)** — Prep ask/walk-away from preferences + offer facts. Draft messages only with user confirm. Update `/workspace/agora/deal-bank/` with asks, counters, outcome.
5. **DM navigator** — Pointer: company, role, offer/deal paths; stage offer/compare/negotiate status.

### Completion criteria

- [ ] offer-bank entry current for the active offer(s).
- [ ] Compare-first rule followed when ≥2 open offers.
- [ ] deal-bank updated when negotiation steps happened.
- [ ] Pointer DM to navigator sent.
- [ ] No fabricate / apply / CreateAgent / user-typed `need`.

## Anti-jobs

| Refuse | Who |
|---|---|
| Search openings | Zetesis |
| Decode / score JD | Hermeneia |
| Tailor resume | Kairos |
| Interview prep | Melete |
| Write masters / story-bank | Mneme |
| Write journey.md | Euodia |
| Apply / CreateAgent | Never / Agora |

## Done

Banks updated. User has compare decision or negotiation next step. Stop.
