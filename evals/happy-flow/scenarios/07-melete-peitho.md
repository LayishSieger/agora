# 07 — Melete + Peitho pointers

**Bots:** Melete (`skills/coach-interview.md`), then Peitho (`skills/negotiate-offer.md`) via navigator.

---

## Part A — Melete

### Read

Pointer from Euodia. Tailored resume + masters + story-bank.

### Melete does

1. Confirm engage post-apply.
2. Deliver short prep plan (no STAR dump).
3. Optionally propose one reusable story; on user yes → **DM Mneme** with proposal (Melete does not write story-bank).
4. DM Euodia: interview prep status (pointer).

### Expected DMs

```
from: Melete
to: Mneme
type: pointer
payload:
  ask: append story-bank
  title: Deploy platform cutover
  path_hint: /workspace/agora/story-bank.md

from: Melete
to: Euodia
type: pointer
payload:
  stage: interview
  company: Helios Data
  role: Staff Platform Engineer
  path: /workspace/agora/applications/resume_helios-data_staff-platform-engineer.md
```

### Mneme (if story confirmed)

Append to `story-bank.md` only. No applications/journey writes.

---

## Part B — Offer → Peitho (navigator)

### User / routine

> Helios Data sent an offer.

### Euodia does

1. Update journey stage to `offer`.
2. Persist is Peitho’s job — Euodia seats with pointer (path once offer-bank entry exists, or seat first with company/role).
3. N9: if ≥2 open offers → compare first; else negotiate. Happy-flow: **one** offer → negotiate.
4. DM Peitho pointer.

### Peitho does

1. Write `/workspace/agora/offer-bank/helios-data-staff-platform.md`.
2. Negotiate path (single offer).
3. Update `deal-bank/` when asks/counters happen.
4. DM Euodia pointer.

### Expected DMs

```
from: Euodia
to: Peitho
type: pointer
payload:
  company: Helios Data
  role: Staff Platform Engineer
  path: /workspace/agora/offer-bank/helios-data-staff-platform.md
  mode: negotiate

from: Peitho
to: Euodia
type: pointer
payload:
  stage: offer
  company: Helios Data
  role: Staff Platform Engineer
  path: /workspace/agora/offer-bank/helios-data-staff-platform.md
  deal: /workspace/agora/deal-bank/helios-data-staff-platform.md
```

## Pass hooks

- Melete did not write story-bank.
- Mneme wrote story-bank only after confirm.
- Peitho sole-wrote offer/deal banks.
- Pointer DMs only; never apply; never CreateAgent.
- Single offer → negotiate (not compare-first).
