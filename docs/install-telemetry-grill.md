# Grill — Agora install telemetry (Vercel `/t`)

**Status:** Round 1 answered. Round 2 asked. Waiting. Do not implement until an explicit **implement**.

**Scope:** `apps/telemetry/`, Agora skill telemetry steps, related docs. Not `bots/euodia/`.

---

## Settled (do not re-ask)

### Pre-grill (CONTEXT, ADR 0004, Agora skills)

| Decision | Source |
|---|---|
| Host: Vercel **`/t`** in this repo (`apps/telemetry/` stub) | ADR 0004 |
| Telemetry **on by default**; honor **`DO_NOT_TRACK`** | ADR 0004 |
| Failure **must not block** create | ADR 0004 |
| Fetch / upgrade-in-place / already-latest: **no** event | Agora skills |
| Failed fetch / no CreateAgent: **no** event | Agora skills |
| Do not send names, resumes, or career files | `need-bot.md` |

**Fact (looked up, not a question):** Layish’s Vercel team has **no** project named `agora`. Existing projects include `lafamiglia`, `my-resume-flow-web`, `layishsieger`, `layish`, `workpath`, and others. `/t` does not exist until a project is created or an existing one is reused.

**Code today:** `apps/telemetry/README.md` is a stub. No `vercel.json`, no route handler.

### Round 1 (Layish, 2026-09-24 — do not re-ask)

| ID | Decision |
|---|---|
| T-R1-Q1 | **A** — One install = one roster **CreateAgent**. Agora template Add and blueprint **fetch** stay quiet in v1. (Revised in chat after a CreateAgent-vs-fetch question; final letter is A, not fetch.) |
| T-R1-Q2 | **A** — Fire as soon as CreateAgent returns an id, even if skill enable failed. |
| T-R1-Q3 | **A** — `GET /t?event=install&bot=…&release=…&agora=1` |
| T-R1-Q4 | **A** — Public `/t` URL in Agora’s skill. `DO_NOT_TRACK` env on the Grok computer skips the request. |
| T-R1-Q5 | **A** — Four fields only; no bot id/account; do not persist IP/UA as product data. |
| T-R1-Q6 | **B** — Append-only: four fields + **server** timestamp. |

Glossary **install event** updated to match Q1/Q2/Q5. No new ADR this round (ADR 0004 still holds; store/host wait on Round 2).

---

## Design tree

```
install telemetry
├── what to count          T-R1-Q1 A ✓
├── when vs skills         T-R1-Q2 A ✓
├── HTTP shape             T-R1-Q3 A ✓
├── URL + DNT location     T-R1-Q4 A ✓
├── anonymity floor        T-R1-Q5 A ✓
└── v1 sink                T-R1-Q6 B ✓
    ├── authenticity / anti-spam     T-R2-Q1  ← frontier
    ├── which Vercel project hosts /t T-R2-Q2  ← frontier (URL is baked into the published skill)
    ├── append medium                T-R2-Q3  ← frontier
    ├── who may read the log         T-R2-Q4  ← frontier
    ├── retention                    T-R2-Q5  ← frontier
    └── client retry                 T-R2-Q6  ← frontier
        └── public stats / badge     (blocked on Q4: only if the log isn’t owner-only)
            └── custom domain        (blocked on Q2)
```

---

## Round 1 (answered)

Questions T-R1-Q1–Q6: see git history of this file or the table above. Letters: A, A, A, A, A, B.

---

## Round 2

Answer with the letter (and a correction if you reject the default). One question at a time from Agora Grok Bot is fine.

---

❓ **T-R2-Q1** - **Open GET vs spam?** `/t` is a public GET anyone can hit. A shared secret in Agora’s skill would leak (public repo + published template). We will persist rows we might quote.

**A.** Open GET. Require `event=install`, `agora=1`, roster **Latin** bot name (Euodia…Peitho), and a non-empty `release`. Drop anything else with 4xx. No secret. Accept that a nuisance client can inflate counts.

**B.** Shared secret (query or header) anyway, knowing it will leak from the skill.

**C.** Open GET as in A, but also reject `release` values that are not a published GitHub Release tag of `LayishSieger/agora` (still spoofable; extra GitHub dependency on every ping).

➡️ **A.** Secret-in-the-skill is theater. Tag-check (C) couples telemetry to GitHub availability and still does not prove CreateAgent happened.

---

❓ **T-R2-Q2** - **Which Vercel project serves `/t`?** The URL is baked into Agora’s skill (T-R1-Q4). Changing it later means an Agora **template republish**. There is no `agora` project today.

**A.** **New** Vercel project on `LayishSieger/agora` (name e.g. `agora`). URL like `agora-*.vercel.app/t` until you add a domain.

**B.** Mount `/t` on an **existing** project (which one: `layishsieger`, `layish`, `web`, …). Stable if that domain already exists; mixes this fleet’s telemetry with another product.

**C.** Leave the URL as a placeholder in the skill until a domain is chosen; most installs send nothing until then.

➡️ **A.** Matches ADR 0004 (“in the same repo”). **C** undoes T-R1-Q4. **B** only if you already want this on a personal site.

---

❓ **T-R2-Q3** - **Where do we append the four fields + server timestamp?** Product data must not include IP/UA (T-R1-Q5). Platform access logs may still exist; we do not treat those as the install log.

**A.** **Vercel Blob** on that project: append-only object(s) with `event`, `bot`, `release`, `agora`, `ts` (UTC).

**B.** **Neon (or other SQL)** table, same columns. Heavier for this volume.

**C.** Function logs only (no Blob/DB). Easy to lose; not a durable append-only log.

➡️ **A.** Smallest durable store on Vercel for a few fields per CreateAgent. **C** fails T-R1-Q6. SQL (B) if you already want queries in v1.

---

❓ **T-R2-Q4** - **Who may read the raw log in this pass?**

**A.** **Owner only** (Blob/private store / Vercel dashboard). No public `/t` read of rows. `GET /t` only **writes**.

**B.** Public **aggregates** later (`Mneme` × `v1.2.0` counts); raw rows still private. Aggregates are **not** built in the first implement unless you insist.

**C.** Public raw log.

➡️ **A** for the first implement. **B** is a later product. **C** makes spam and scraping the default.

---

❓ **T-R2-Q5** - **How long do we keep rows?** Volume is one row per successful CreateAgent.

**A.** Keep until you choose to delete. No TTL in v1.

**B.** 90 days.

**C.** 1 year, then drop.

➡️ **A.** Low volume; TTL can wait. Deleting later is easier than reconstructing dropped rows.

---

❓ **T-R2-Q6** - **Retry if the GET fails?** Failure must not block CreateAgent. We have **no** bot id to dedupe (T-R1-Q5). A retry after a silent success double-counts.

**A.** **One** GET, ignore result, never retry, never queue on disk.

**B.** Retry once immediately on network error.

**C.** Write a local marker and retry on a later turn (high double-count risk).

➡️ **A.** Lost pings beat duplicate rows. Matches fire-and-forget.

---

## Held for later (do not answer yet)

- Public stats / badge (only if T-R2-Q4 is not owner-only forever)
- Custom domain (after a project exists)
- Rate limits / Vercel Firewall numbers
- ADR for store+host (offer after this round if A/A/A-style choices stick — hard to reverse, surprising, real trade-off)

## Domain-modeling

- **install event** glossary tightened after Round 1.
- Still no HTTP verbs or Vercel product names in `CONTEXT.md`.

---

## Stop

Wait for Layish (Agora Grok Bot / Cloud Agent relay). Do not start Round 3 until this round is answered. Do not author `apps/telemetry` route code until **implement**.
