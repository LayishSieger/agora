# Grill — Agora install telemetry (Vercel `/t`)

**Status:** Rounds 1–3 **locked**. v1 is enough to author. **Stopped — wait for explicit implement.** Do not implement the route or Agora client until then.

**Scope:** `apps/telemetry/`, Agora skill telemetry steps, related docs. Not `bots/euodia/`.

---

## Settled (do not re-ask)

### Pre-grill

ADR 0004: Vercel `/t` in this repo; telemetry on by default; honor `DO_NOT_TRACK`; failure must not block create. Skills: no install event on fetch, upgrade-in-place, already-latest, or failed CreateAgent. No career files on the wire.

**Fact:** No Vercel project named `agora` yet. No template-Add webhook — first Agora turn / first-run is the hook.

### Round 1

| ID | Letter |
|---|---|
| T-R1-Q1 | **A** — install event = roster CreateAgent only (not fetch; Add is not an install event) |
| T-R1-Q2 | **A** — fire on CreateAgent id |
| T-R1-Q3 | **A** — `GET /t` query |
| T-R1-Q4 | **A** — public URL in skill; `DO_NOT_TRACK` env skips requests |
| T-R1-Q5 | **A** — no bot id / account / IP-UA as product data |
| T-R1-Q6 | **B** — append-only + server timestamp |

### Round 2

| ID | Letter |
|---|---|
| T-R2-Q1 | **D** — opaque install id + Agora registration (not open GET / leaked secret / tag-check) |
| T-R2-Q2 | **A** — new Vercel project on `LayishSieger/agora` |
| T-R2-Q3 | **A** — Vercel Blob |
| T-R2-Q4 | **A** — owner only; writes via register + `/t` |
| T-R2-Q5 | **A** — keep until delete |
| T-R2-Q6 | **A** — `/t` one-shot, ignore result, never retry, never queue |

### Round 3

| ID | Letter |
|---|---|
| T-R3-Q1 | **B** — client mints UUID, writes locally first, register upserts |
| T-R3-Q2 | **A** — first turn if local id missing, before CreateAgent, even if fetch will fail |
| T-R3-Q3 | **A** — DNT skips register and `/t`; CreateAgent still runs |
| T-R3-Q4 | **A** — `/workspace/bots/INSTALL_ID`, not inside `FIRST_RUN` |
| T-R3-Q5 | **A** — `GET /r?agora=1&id=` upsert; `/t` only `event=install` with a known id |
| T-R3-Q6 | **A** — never block create; skip `/t` until later upsert of the **same** id |
| T-R3-Q7 | **B** — require ids on `/t`; treat Agora registration counts as **untrusted** until rate-limit exists |

---

## Design tree (v1 frontier empty)

```
install telemetry
├── install event = CreateAgent     ✓
├── fire on CreateAgent id          ✓
├── GET /t                          ✓
├── public URL + local DNT          ✓
├── anonymity                       ✓
├── append-only + server ts         ✓
└── install id + Agora registration ✓
    ├── Vercel project + Blob + owner-only + no TTL + /t no retry  ✓
    └── mint / when / DNT / disk / HTTP / fail / untrusted counts  ✓
        └── later (not v1): custom domain, public stats, rate-limit numbers
```

Leftover branches are **out of v1**, not unanswered v1 product calls: custom domain, public badge, Firewall numbers, Blob key layout (author-time).

ADR **0010** records host + Blob + install id (why not open GET). Glossary updated. `AGORA-PLAN.md` telemetry bullets match.

---

## v1 author checklist (when told **implement** — not this turn)

- New Vercel project on this repo; private Blob; `GET /r` upsert; `GET /t` CreateAgent rows with known id only; no public read.
- Agora skills: mint + `INSTALL_ID` + `/r` before CreateAgent; `/t` after success; DNT skips both; never block; never second id; `/t` one-shot.
- Do not treat Agora counts as trusted. Do not touch `bots/euodia/`.

---

## Stop

Shared understanding for v1. Do not author `apps/telemetry` or skill telemetry steps until Layish says **implement**.
