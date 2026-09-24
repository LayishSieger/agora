# Grill — Agora install telemetry (Vercel `/t`)

**Status:** Round 1 asked. Waiting for answers. Do not implement the route or Agora client until an explicit **implement**.

**Scope:** `apps/telemetry/`, Agora skill telemetry steps, related docs. Not Euodia/Mneme blueprints (`bots/euodia/` is another agent).

**Skills:** `/grill-with-docs` (grilling + domain-modeling). Glossary terms stay as in `CONTEXT.md` until a question resolves a new term.

---

## Settled (do not re-ask)

From `CONTEXT.md`, ADR 0004, `AGORA-PLAN.md`, `bots/agora/skills/need-bot.md`, `first-run.md`, `fetch-blueprint.md`:

| Decision | Source |
|---|---|
| **install event** fires only after **successful CreateAgent** | glossary, ADR 0004 |
| Payload: `event=install`, **bot name**, **blueprint-release** name, `agora=1` | glossary |
| Not a GitHub zip download count | glossary, ADR 0004 |
| Telemetry **on by default**; honor **`DO_NOT_TRACK`** | ADR 0004, plan |
| Failure **must not block** create | ADR 0004 |
| Host: Vercel **`/t`** in this repo (`apps/telemetry/` stub) | ADR 0004, domain layout |
| Fetch blueprint: **no** telemetry | `fetch-blueprint.md` |
| Need-bot **upgrade in place**: **no** install event (not CreateAgent) | `need-bot.md` |
| Existing bot, `RELEASE` already latest: **no** telemetry | `need-bot.md` |
| Failed fetch / no CreateAgent: **no** event | `first-run.md` / `need-bot.md` |
| Do not send names, resumes, or career files | `need-bot.md` |
| If no install URL yet: **skip** | `need-bot.md` (current skill) |

**Not CreateAgent:** user **Add** of the thin Agora **installer template**. That path has no install event in the glossary today.

**Code today:** `apps/telemetry/README.md` is a stub. No `vercel.json`, no route handler.

---

## Design tree (frontier = Round 1)

```
install telemetry
├── what to count (Q1)          ← open
├── when vs skills (Q2)         ← open; CreateAgent success is settled
├── HTTP shape of /t (Q3)       ← open
├── where client reads URL + DNT (Q4) ← open
├── anonymity floor (Q5)        ← open (“anonymous” is fuzzy)
└── v1 sink (Q6)                ← open
    └── authenticity / anti-spam  (blocked on Q6: only if we persist counts we trust)
        └── store product         (blocked on Q6 persist)
```

---

## Round 1

Answer with the letter (and a correction if you reject the default). One question at a time from Agora Grok Bot is fine; this file keeps the full round.

---

❓ **Q1** - **What is one install?** First-run CreateAgents Euodia (if the blueprint exists) and Mneme — that is **two** install events. Adding the Agora template is **not** CreateAgent.

**A.** Only roster **CreateAgent** (Euodia, Mneme, later `need`). Agora template Add is invisible to telemetry. First-run can emit 1–2 events.

**B.** Same as A, plus a **separate** event when Agora itself is Added (`event=installer` or similar). That needs a new glossary term and a client that can run on template Add (not only after CreateAgent).

**C.** One event per **foundation** (collapse Euodia+Mneme into a single first-run ping). Lazy `need` still one event per CreateAgent.

➡️ **A.** Matches the glossary. **B** is a different product (installer-template count). **C** hides Euodia `FAILED` vs Mneme success.

---

❓ **Q2** - **Fire if CreateAgent succeeded but skill enable failed?** `need-bot` CreateAgents, then enables `skills/*.md`, then telemetry. Glossary says after successful **CreateAgent**, not after a complete skill install.

**A.** Fire as soon as CreateAgent returns an id. Skill failure is not a reason to omit the event.

**B.** Fire only if CreateAgent **and** every `skills/*.md` enabled.

**C.** Fire only if CreateAgent succeeded **and** at least `profile.md` is on disk with `RELEASE` written.

➡️ **A.** Aligns with CONTEXT. Skill enable is a separate failure; we still created a bot. **C** is almost always true on the success path anyway.

---

❓ **Q3** - **HTTP contract for `/t`?** Agora on a Grok computer must fire-and-forget. skills.sh-style CLIs often `GET` a query string.

**A.** `GET /t?event=install&bot=Mneme&release=v1.2.0&agora=1` (query only).

**B.** `POST /t` with JSON `{ event, bot, release, agora }`.

**C.** `GET` for the bot; `POST` allowed for tests. Same fields.

➡️ **A.** Smallest thing a skill can `curl` without a body. No extra headers to forget. **C** if you want a test harness later; still implement **A** as the Agora path.

---

❓ **Q4** - **Where does Agora get the install URL, and where is `DO_NOT_TRACK`?** Today the skill says “if an install URL is configured.” Template users will not have a private env unless we document one.

**A.** **Public** `/t` URL written in Agora’s skill (this repo’s Vercel deployment). `DO_NOT_TRACK` = env var on the **Grok Bot computer** (any truthy value → do not send). No URL in career files.

**B.** URL and DNT both env vars on the Grok computer (`AGORA_TELEMETRY_URL`, `DO_NOT_TRACK`). No URL in the skill. Template Add does not send until someone sets the URL.

**C.** Always send; only the **server** honors DNT (header or query). Client never skips.

➡️ **A.** ADR already names the host. Baking the public URL means installs work without extra config; DNT stays a local opt-out. **B** keeps today’s “skip if no URL” forever for most users. **C** still leaves a network beacon (worse privacy).

---

❓ **Q5** - **What does “anonymous” forbid?** Glossary forbids career SoT. It does not say bot **id**, account, IP, or User-Agent.

**A.** Client sends **only** the four fields. No bot id, no account, no user name. Server **must not** persist IP / User-Agent as product data (platform access logs may still exist; do not build features on them).

**B.** Also send a **hash** of bot id or account so we can dedupe double-fires without storing the id.

**C.** Send bot id in the clear (easier debug; not anonymous).

➡️ **A.** Deduping (B) is Round 2 if we care about double-count. **C** contradicts the glossary.

---

❓ **Q6** - **What does `/t` do with a valid event in this implementation pass?** Stub today. Authenticity (shared secret vs open GET) waits until we know whether we persist numbers we will quote.

**A.** **204 + drop.** Prove the pipe; no store. Counts stay “we’ll add a sink later.”

**B.** **Append-only** records: the four fields + server timestamp. Enough to answer “did Mneme @ v1.2.0 fire?”

**C.** **Counters only** (e.g. `Mneme` × `v1.2.0` += 1). No per-event log.

➡️ **B.** ADR wants Agora-attributed install stats, not a no-op. Counters (C) lose first-run vs `need` timing. Drop (A) is a fine spike but not the ADR. Round 2: retention, who can read, anti-spam.

---

## Held for later rounds (do not answer yet)

- Shared secret vs open `/t` (spam)
- Retention, who can read the log, public badge
- Retry after a failed ping (double-count risk)
- Whether `agora=1` is a literal query flag or a marker we infer
- New glossary terms (`installer Add` vs install event) unless Q1 = B
- ADR 0004 reopen only if Q1/Q6 contradict it

## Domain-modeling notes (no CONTEXT edit this round)

- **install event** is already defined; Q1 tests whether **installer template Add** is the same concept (it is not, unless you choose B).
- **anonymous** is fuzzy until Q5.
- Do not add HTTP or Vercel details to `CONTEXT.md`.

---

## Stop

Wait for Layish (via Agora Grok Bot / Cloud Agent relay). Do not start Round 2 until this round is answered. Do not author `apps/telemetry` route code until **implement**.
