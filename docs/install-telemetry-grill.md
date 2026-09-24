# Grill — Agora install telemetry (Vercel `/t`)

**Status:** Round 2 answered (Q1 revised to **D**). Round 3 asked. Waiting. Do not implement until an explicit **implement**.

**Scope:** `apps/telemetry/`, Agora skill telemetry steps, related docs. Not `bots/euodia/`.

---

## Settled (do not re-ask)

### Pre-grill (CONTEXT, ADR 0004, Agora skills)

| Decision | Source |
|---|---|
| Host: Vercel **`/t`** in this repo | ADR 0004 |
| Telemetry **on by default**; honor **`DO_NOT_TRACK`** | ADR 0004 |
| Failure **must not block** create | ADR 0004 |
| Fetch / upgrade-in-place / already-latest: **no** install event | Agora skills |
| Failed fetch / no CreateAgent: **no** install event | Agora skills |
| Do not send names, resumes, or career files | `need-bot.md` |

**Fact:** No Vercel project named `agora` on Layish’s team today. No documented Grok **template-Add webhook** — the practical hook is Agora’s first turn / **first-run** (`first-run.md`).

**Code today:** `apps/telemetry/README.md` stub. No route handler.

### Round 1 (Layish, 2026-09-24 — locked)

| ID | Decision |
|---|---|
| T-R1-Q1 | **A** — **install event** = roster **CreateAgent** only. Not fetch. Template Add is **not** an install event. |
| T-R1-Q2 | **A** — Fire install event as soon as CreateAgent returns an id. |
| T-R1-Q3 | **A** — `GET /t` query string for install events. |
| T-R1-Q4 | **A** — Public telemetry URL in Agora’s skill. `DO_NOT_TRACK` env skips **requests**. |
| T-R1-Q5 | **A** — No bot id, account, IP/UA as product data. |
| T-R1-Q6 | **B** — Append-only rows + **server** timestamp. |

**Wire shape after Round 2 D:** install event GET also presents **install id**. That is not a person/account id. T-R1-Q5 still forbids those.

### Round 2 (Layish, 2026-09-24 — locked)

| ID | Decision |
|---|---|
| T-R2-Q1 | **D** (not A/B/C) — Reject open GET. **Register** an opaque **install id**. **Agora registration** tracks Agora installation (the meter Round 1 left out). CreateAgent `/t` pings **must** present a valid registered id. |
| T-R2-Q2 | **A** — New Vercel project on `LayishSieger/agora`. |
| T-R2-Q3 | **A** — Vercel Blob for registry + CreateAgent rows. |
| T-R2-Q4 | **A** — Owner only. Writes via **register** + `/t`. No public read. |
| T-R2-Q5 | **A** — Keep until delete. No TTL in v1. |
| T-R2-Q6 | **A** — Install-event GET: one shot, ignore result, never retry, never queue. (**Register** is a different call: it may need a 2xx; do not copy this blindly — Round 3.) |

Glossary: **install id**, **Agora registration**, **install event** (id required). Two meters: registration ≠ CreateAgent event.

---

## Design tree

```
install telemetry
├── install event = CreateAgent     T-R1-Q1 A ✓
├── fire on CreateAgent id          T-R1-Q2 A ✓
├── GET /t query                    T-R1-Q3 A ✓
├── public URL + local DNT          T-R1-Q4 A ✓
├── no account / bot id / IP-UA     T-R1-Q5 A ✓
├── append-only + server ts         T-R1-Q6 B ✓
└── auth + Agora meter              T-R2-Q1 D ✓
    ├── new Vercel project          T-R2-Q2 A ✓
    ├── Blob                        T-R2-Q3 A ✓
    ├── owner-only                  T-R2-Q4 A ✓
    ├── no TTL                      T-R2-Q5 A ✓
    ├── /t no retry                 T-R2-Q6 A ✓
    └── register flow               ← Round 3 frontier
        ├── who mints install id    T-R3-Q1
        ├── when Agora registers    T-R3-Q2
        ├── DNT vs register         T-R3-Q3
        ├── where id lives on disk  T-R3-Q4
        ├── register HTTP path      T-R3-Q5
        ├── register fail vs create T-R3-Q6
        └── open register spam      T-R3-Q7
            └── custom domain / public stats   (later)
            └── ADR 0010 host+Blob+id          (after this round)
```

---

## Round 2 Q1 as asked vs D

Draft A/B/C were open GET / leaked secret / tag-check. Layish **rejected** those. **D:** opaque install-id registration + Agora registry. CreateAgent `/t` requires a valid id.

Round 1 Q1 stays: Add is still not an **install event**. Registration is the Add/installer meter.

---

## Round 3

Answer with the letter. One at a time from Agora Grok Bot is fine.

**Scenario to keep in mind:** User Adds Agora, GitHub is down, first-run cannot CreateAgent. Should the **Agora** meter still tick? If yes, register **before** CreateAgent. There is no Add webhook — first Agora turn / first-run is the hook.

**Scenario:** Register GET succeeds on the server, response body lost. If the **server** minted the id, a retry mints a **second** Agora row. If the **client** minted and saved the file first, retry is the same id.

**Scenario:** Workspace wiped, Agora bot still on the account. Local install id is gone → new registration (second Agora row). We cannot dedupe without an account id (forbidden).

---

❓ **T-R3-Q1** - **Who mints the install id?**

**A.** Server mints, returns in the register response. Client must parse the body. Lost body + retry → two registry rows.

**B.** Client mints an opaque id (e.g. UUID), **writes it locally first**, then register **upserts** that id. Retry is the same id.

**C.** Server mints; client never retries register (lost body → no `/t` forever).

➡️ **B.** Only option that is both anonymous and retry-safe.

---

❓ **T-R3-Q2** - **When does Agora register?** (the Agora-installation meter)

**A.** First Agora turn that needs first-run (or any turn if the local id file is missing), **before** CreateAgent, even if fetch will fail. User who Added Agora but got no Mneme still counts as an Agora installation.

**B.** Only immediately before the **first successful CreateAgent**. Agora meter stays 0 until a child exists.

**C.** Only after `FIRST_RUN` has `greeted=yes` (foundation looks complete).

➡️ **A.** You asked the registry to track Agora installation, not Mneme. **B**/**C** hide failed first-runs.

---

❓ **T-R3-Q3** - **`DO_NOT_TRACK` vs register?** T-R1-Q4: env set → skip telemetry requests.

**A.** Skip **register and** `/t`. No Blob row, no local id required. CreateAgent still runs.

**B.** Still register (Agora count), skip only CreateAgent `/t`.

**C.** Ignore DNT for register because it is “just an id.”

➡️ **A.** Registration **is** tracking Agora installation. DNT means both meters stay dark.

---

❓ **T-R3-Q4** - **Where does the install id live on the Grok computer?** Must not sit under `/workspace/agora/` (career SoT). ADR 0009 already uses `/workspace/bots/FIRST_RUN` for greeting.

**A.** Separate `/workspace/bots/INSTALL_ID` (Agora sole-writes). Can exist if first-run never greets.

**B.** A field inside `FIRST_RUN`. No id unless that marker exists.

**C.** Environment variable only (template users will not set it).

➡️ **A.** Greeting marker ≠ telemetry token. **C** breaks T-R1-Q4 (baked URL, local DNT only).

---

❓ **T-R3-Q5** - **Register HTTP?** `/t` stays GET query for **install events** (T-R1-Q3) plus `id=`. Register must be allowed to **succeed** (2xx) so `/t` will accept the id. T-R2-Q6 (ignore result) applies to **install events**, not necessarily to register.

**A.** Separate `GET /r?agora=1&id=<opaque>` (upsert). `/t` only accepts `event=install` with a **known** id.

**B.** Same `/t` with `event=register&id=…` (one route, two events).

**C.** `POST /r` JSON.

➡️ **A.** Keeps `/t` = CreateAgent. GET so the skill can `curl` like `/t`. **C** is heavier for a skill.

---

❓ **T-R3-Q6** - **If register fails (or `/t` sees an unknown id)?**

**A.** CreateAgent and first-run **proceed**. Skip `/t` until a later turn can upsert the same local id. Never block create. Do not invent a second id.

**B.** Block CreateAgent until register 2xx (contradicts ADR 0004).

**C.** CreateAgent proceeds; on unknown id, `/t` **creates** the registry row implicitly (register-on-ping). Then T-R3-Q2’s “register before create” is optional.

➡️ **A.** Failure must not block. Implicit register-on-`/t` (**C**) collapses two meters and lets a spam `/t` mint ids again.

---

❓ **T-R3-Q7** - **Register is still a public mint.** Anyone can `GET /r` and inflate the **Agora** count; they can then spam `/t` with those ids. Opaque ids stop *unregistered* CreateAgent pings, not a determined spammer.

**A.** Accept approximate Agora counts in v1. No secret. Rate-limit later if needed.

**B.** Ship register anyway but treat Agora counts as **untrusted** until Firewall/rate-limit exists; still require ids on `/t` so casual scrapes of `/t` alone do not write CreateAgent rows.

**C.** Hold implementation until register is not publicly mintable (real auth). Contradicts “skill is public.”

➡️ **B.** Honest about D: we stopped drive-by `/t` writes, not a motivated counterfeit. **C** stalls the ADR. **A** is fine if you will quote counts as truth — say so if you pick A.

---

## Held for later

- Custom domain, public stats/badge (owner-only for now)
- Numeric rate limits / Firewall
- ADR 0010 (new project + Blob + install id, not open GET) — **offer after Round 3** when when/who-mints stick

## Domain-modeling

- Called out: T-R1-Q1 “Add is quiet” vs T-R2-Q1 D “track Agora installation” → two terms, not a silent override of Q1.
- T-R1-Q5 four fields → install event **also** carries **install id** (capability token, not identity).
- No Vercel/Blob/HTTP in `CONTEXT.md`.

---

## Stop

Wait for Layish. Do not start Round 4 until this round is answered. Do not author `apps/telemetry` until **implement**.
