# Grill — Blueprint fetch contract

Status: **round 1 answered; round 2 asked.** Do not implement until this grill is closed and Layish says **implement**.

This is the contract for **blueprint fetch**: bytes from GitHub → disk on the Grok computer. It is **not** CreateAgent, not skill enable, not first-run greeting, not `need` parsing, not install telemetry.

Answers: CloudAgent reply from Agora Grok, one question at a time there; full rounds relayed.

`bots/agora/skills/fetch-blueprint.md` is still a **steward draft**. Round 1 contradicts its restore sentence and in-place overwrite. Do not edit that skill until **implement**.

---

## Settled (do not re-ask)

| Decision | Where |
|---|---|
| Fetch GitHub’s **latest published Release**, not `main` | ADR 0007 |
| Do **not** pin a version forever in the Agora skill; v1 has **no restore** to an older tag | ADR 0007, F-R1-Q6 **A** |
| Record `tag_name` in `RELEASE`; upgrade later compares to a newer latest | ADR 0007, F-R1-Q4 **A** |
| Installed path `/workspace/bots/<slug>/` + `RELEASE`; no versioned subfolders | ADR 0008 |
| Career SoT stays `/workspace/agora/`; fetch never writes it | ADR 0005 / 0008 |
| Existing child **bot**: never a second CreateAgent; ask before refresh if `RELEASE` stale | ADR 0008, `need-bot.md` |
| Fetch is **not** an install event | glossary **install event** |
| One roster slug on disk. Not Agora. Not `apps/` / `docs/` | `fetch-blueprint.md` |
| Missing `profile.md` after extract → fail. README-only is not creatable | skills |
| No invent / gist / paste / fork / `main` fallback | ADRs + F-R1-Q3 **A** |
| **Wire:** GitHub source zipball for the Release tag; extract only `bots/<slug>/` | F-R1-Q1 **A**, ADR 0010 |
| **Disk:** atomic replace (temp + swap); live folder matches the shipped tree; `RELEASE` only after success; previous snapshot untouched on failure | F-R1-Q2 **C**, ADR 0011 |
| **Auth:** anonymous HTTPS; 401/403/429 fail; no token required | F-R1-Q3 **A**, ADR 0010 |
| **Integrity:** trust GitHub HTTPS; `RELEASE` is only `tag_name` | F-R1-Q4 **A** |
| **Idempotency:** dumb pull; callers decide when to invoke | F-R1-Q5 **A** |

Consequence of F-R1-Q2 **C** (not a new question): anything extra under `/workspace/bots/<slug>/` (scratch notes, leftover skills) is gone after a successful fetch. That folder is the installed blueprint, not a user notebook. Career files belong under `/workspace/agora/`.

---

## Facts (looked up; not user questions)

- Repo `LayishSieger/agora` is **public**. There may still be **zero** Releases; `/releases/latest` is then 404. Fail closed until a Release exists.
- Source zipball exists even with **no** Release assets.
- `/releases/latest` ignores drafts and prereleases.
- Unauthenticated REST ~**60 req/hour/IP**. One zipball is cheap; Contents API is not (ADR 0010).
- Zip member prefix is GitHub’s archive first component — do **not** hardcode it. Strip it; keep `bots/<slug>/`.
- `first-run.md` resolves latest **once**, then fetches Euodia and Mneme. `FIRST_RUN` has a **single** `tag=` field. Whether those two slugs may differ is round 2.
- `RELEASE` is **not** in the GitHub tree. After swap, fetch writes `RELEASE` into the live folder (shipped tree + that file).
- This grill does not change `bots/euodia/` or telemetry routes. Doc-only branch: Vercel project `agora` (root `apps/telemetry`) may ERROR on preview; production stays the telemetry branch.

---

## Design tree

```
fetch contract
├── wire zipball (R1 Q1) ✓          → zip reuse in one steward turn (R2 Q2)
├── atomic replace (R1 Q2) ✓
├── anonymous HTTPS (R1 Q3) ✓
├── RELEASE = tag_name (R1 Q4) ✓
├── dumb pull (R1 Q5) ✓
├── latest only, no restore (R1 Q6) ✓ → same tag for first-run pair? (R2 Q1)
├── failure reasons to callers (R2 Q3)
└── what zip members are allowed (R2 Q4)
```

Still later / not fetch: prerelease channel, restore skill, repair when bot exists but folder missing (`need-bot`), timeout numbers, telemetry, CreateAgent, upgrade **ask** UX.

---

## Round 1 (answered)

Layish, Agora Grok chat, one-by-one.

| ID | Question | Answer |
|---|---|---|
| F-R1-Q1 | What is fetched on the wire? | **A** — GitHub source zipball; extract only `bots/<slug>/` |
| F-R1-Q2 | Overlay or replace / partial extract? | **C** — Atomic replace; `RELEASE` after success; previous snapshot untouched on failure |
| F-R1-Q3 | Auth on the installer computer? | **A** — Anonymous HTTPS; 401/403/429 fail; no `main` fallback |
| F-R1-Q4 | Integrity? | **A** — Trust GitHub HTTPS; `RELEASE` is only `tag_name` |
| F-R1-Q5 | If `RELEASE` already equals latest, still download? | **A** — Dumb pull; callers decide when to invoke |
| F-R1-Q6 | Non-latest tag in v1? | **A** — Latest only; restore is a later skill |

---

## Round 2

❓ **Q1** - **Must Euodia and Mneme in one first-run share one blueprint release?**

Fetch is a dumb pull of **latest** (R1 Q5/Q6). First-run calls it twice. `/releases/latest` can change between those calls. `FIRST_RUN` still has one `tag=` line.

**A.** Each fetch independently resolves latest. Mixed tags are allowed (rare). `FIRST_RUN` `tag=` is whatever Mneme (or the last successful fetch) recorded — document that at implement time.

**B.** Both slugs must come from the **same** tag. Resolve latest once at the start of first-run. Fetch may take that tag **only if** it still **is** `/releases/latest` at call time (not restore). If latest moved before the second slug, **fail that fetch** rather than mix. (Risk: Mneme fails because a Release landed mid-first-run.)

**C.** Same tag for the whole first-run **even if** latest moves mid-flight: a one-turn snapshot. Fetch may use the caller’s tag for that turn without it remaining `/releases/latest`. This is **not** user-facing restore (R1 Q6 stays).

➡️ **A.** Keep fetch dumb and latest-only. Mixed tags are unlikely; failing Mneme (B) is worse than a one-off mismatch. C is an in-flight pin and fights R1 Q6. First-run already allows Euodia `FAILED` and Mneme success on **different** failure modes; different tags are the same family of “foundation is not one atomic transaction.”

---

❓ **Q2** - **May one zipball serve two slug extracts in the same steward turn?**

R1 Q1 is whole-tag zipball, one slug on disk. First-run (and a future bulk upgrade) would otherwise GET the same zip twice. Independent of Q1: this is HTTP reuse, not a pin.

**A.** Every fetch invocation GET the zipball. No reuse.

**B.** Same Agora turn may reuse bytes already downloaded for **that** latest tag to extract another roster slug (same extract/swap/`RELEASE` rules). No on-disk zip cache across turns or chats.

**C.** Persist the zip under `/tmp` (or similar) keyed by tag across turns until reboot.

➡️ **B.** Two anonymous zip GETs per first-run is fine today; reuse is still the obvious first-run reading of “resolve latest once.” C is a cache with stale-zip bugs we do not need. If Q1 is **A**, reuse is optional sugar; if Q1 is **B** or **C**, reuse is how you get two slugs from one snapshot.

---

❓ **Q3** - **What does a failed fetch return to the caller?**

Callers already branch: first-run continues if Euodia has no `profile.md`, but must **not** greet if there is no Release at all. Fetch must fail closed; the *reason* is what lets the caller choose.

**A.** Opaque failure. One user-visible line. Callers do not distinguish “no Release yet” from “this slug has no `profile.md`.”

**B.** Closed set of reasons, user-visible one-liners each: `no_release` (404/empty latest), `http` (401/403/429/5xx/network), `bad_archive` (zip/path-escape/symlink policy), `missing_profile` (tree extracted but no `profile.md`). Callers branch; no CreateAgent on any of them.

**C.** Same reasons as **B**, plus machine-only detail (status code, URL) in the skill log, never in telemetry.

➡️ **B.** First-run already needs “no Release → fail both” vs “Euodia stub → `FAILED`, still Mneme.” C is logging chrome; skip until we have a log. Do not invent extra reasons (`disk_full` stays an `http`/`bad_archive` equivalent: fail, previous snapshot untouched).

---

❓ **Q4** - **What zip members may become files under the slug?**

R1 Q2: live folder **is** the shipped tree. Path escape is already rejected. Remaining: symlinks, binaries, unexpected names.

**A.** **Regular files and directories only** under `bots/<slug>/`. Reject symlinks (even if they would stay inside the slug), devices, and executables-as-payloads. Do not run anything from the zip. Markdown/YAML/text as authored; a stray `.png` in `guides/` may ship if it is a regular file.

**B.** Allow **relative symlinks** that stay inside `bots/<slug>/` after extract. Reject escaping links.

**C.** Regular files only, and **only** these names: `profile.md`, `README.md`, `skills/`, `prompts/`, `guides/`, `schemas/`. Unknown paths in that slug are dropped (not a fail).

➡️ **A.** Blueprints are markdown trees; symlinks are a zip-slip footgun. C would silently drop a future `bots/mneme/examples/` and look like success. Unknown regular files in the slug are part of the snapshot (R1 Q2). A stray binary is rare and still data, not something we execute.

---

## After round 2 (do not answer now)

- Exact user-facing sentences (copy) for each Q3 reason.
- Numeric zip size / time caps.
- Repair: bot exists, folder missing (or the reverse) — `need-bot`, not fetch.
- Restore / pin skill (after v1).
- Prerelease channel (`/latest` ignores them — leave it).
- Editing `fetch-blueprint.md` to match this contract (**implement** only).
