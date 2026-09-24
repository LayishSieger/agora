# Grill — Blueprint fetch contract (round 1)

Status: **round 1 asked; answers not in yet.** Do not implement until this grill is closed and someone says **implement**.

This is the contract for Agora’s **Fetch blueprint** subroutine: bytes from GitHub → disk on the Grok computer. It is **not** CreateAgent, not skill enable, not first-run greeting, not `need` parsing, not install telemetry.

Answers: CloudAgent reply from Agora Grok, one question at a time there; full rounds relayed.

---

## Settled (do not re-ask)

| Decision | Where |
|---|---|
| Fetch GitHub’s **latest published Release**, not `main`, not a floating branch | ADR 0007 |
| Do **not** pin a version forever inside the Agora skill | ADR 0007 |
| Record which release was used; a later upgrade path can notice a newer latest | ADR 0007, glossary **blueprint release** |
| Installed path `/workspace/bots/<slug>/` + `RELEASE` file; no versioned subfolders | ADR 0008 |
| Career SoT stays `/workspace/agora/`; fetch never writes it | ADR 0005 / 0008 |
| If a child **bot** of that name already exists: never CreateAgent a second copy; if `RELEASE` missing/older than latest, **ask** before refresh | ADR 0008, `need-bot.md` |
| Fetch is **not** an install event. Telemetry is CreateAgent (`event=install`). Agora template registration is separate. Honor `DO_NOT_TRACK` elsewhere | glossary **install event**; plan telemetry |
| One roster slug only. Not Agora. Not `apps/`, `docs/`, or the rest of the repo as an installed tree | `fetch-blueprint.md` |
| Missing `profile.md` after extract → fail. README-only stub is not a creatable blueprint | `fetch-blueprint.md`, `first-run.md` |
| No invent / gist / paste / fork / `main` fallback | ADRs + skills |
| Fetch does not enable skills, greet, or CreateAgent | `fetch-blueprint.md` |

`bots/agora/skills/fetch-blueprint.md` is a **live steward draft**, not an ADR. Several of its lines (whole-tag zip, in-place overwrite, caller-named non-latest tag) are what this round is grilling. Treat them as proposed defaults, not locks.

---

## Facts (looked up; not user questions)

- Repo `LayishSieger/agora` is **public**. `GET /repos/LayishSieger/agora/releases` is **empty**. `GET …/releases/latest` is **404** today. A correct fetch implementation **must fail closed** until the first Release exists. That is ADR 0007 working as designed, not a bug to paper over with `main`.
- GitHub **source zip** for a Release exists even when **no Release assets** are uploaded (`zipball_url` / `archive/refs/tags/<tag>.zip`). Attaching a custom zip is extra release labor, not required for a tag to be downloadable.
- `/releases/latest` is GitHub’s latest **published**, non-draft, non-prerelease Release. Drafts and prereleases are invisible to that endpoint.
- Unauthenticated GitHub REST is tightly rate-limited (on the order of **60 req/hour/IP**). A Contents-API walk of `bots/mneme/` (profile + skills + prompts + schemas) can burn that in one first-run. A single zipball is one (or two) HTTP GETs.
- Source-zip member paths are `\<first-component\>/bots/<slug>/…`. The first component is GitHub’s archive prefix (repo + ref; do **not** hardcode it). Extractors strip that prefix and keep only `bots/<slug>/`.
- `first-run.md` already resolves latest **once**, then fetches Euodia and Mneme separately. Whether that means one zip and two extracts is **downstream** of Q1 (later round).
- Parallel work: Euodia authorship and `/t` telemetry. This grill does not change `bots/euodia/` or telemetry routes.

### Language to sharpen later (after answers)

The skill says “Do not fetch the whole repo” and also “download that tag’s source zip.” Those are different things: **release archive** (bytes on the wire, may be the whole tagged tree) vs **installed blueprint** (only `/workspace/bots/<slug>/` on disk). Pick terms once Q1 lands; glossary stays implementation-free.

The skill’s “overwrite that folder’s blueprint files” is ambiguous: overlay (deleted upstream files remain on disk) vs replace (the folder becomes exactly the shipped tree). Q2.

---

## Design tree (this frontier)

```
fetch contract
├── how bytes arrive (Q1)          → later: share one archive across slugs in first-run
├── how the slug folder is replaced (Q2) → later: crash mid-write, disk full
├── GitHub credentials on the box (Q3)
├── integrity recorded in RELEASE (Q4) → later: exact RELEASE file shape if more than tag
├── fetch vs already-current tag (Q5)
└── off-latest restore in v1 (Q6)  → later: user-facing `need Mneme@v1.0.0` syntax
```

Not in this round (blocked or already locked): timeout/size caps, error copy, prerelease channel, fetching Agora itself, telemetry on fetch, CreateAgent, upgrade **ask** UX (ADR 0008).

---

## Round 1

❓ **Q1** - **What is fetched on the wire?**

CreateAgent needs the tagged snapshot of **one** slug. ADR 0004 allows “tagged release zip or equivalent HTTPS.” The skill draft always downloads the **whole-tag source zip**, then extracts `bots/<slug>/` only.

**A.** GitHub **source zipball** for that Release’s tag (`zipball_url` or `archive/refs/tags/<tag>.zip`). Extract only members under `bots/<slug>/`. Reject `..`, absolute paths, and escaping symlinks. Do not require custom Release assets.

**B.** **Per-file HTTPS** (Contents API or `raw.githubusercontent.com/<tag>/bots/<slug>/…`). No zip. Must know or recurse the file list.

**C.** **Attached Release asset** we upload ourselves (e.g. `euodia.zip` per bot, or `blueprints.zip`). Source zipball is not the contract.

➡️ **A.** One or two GETs, works with empty asset lists, matches ADR 0004, and keeps “do not install the whole repo on disk.” B dies on unauthenticated rate limits (Mneme is already many files). C adds a release packaging step we do not have and will forget. First-run downloading the same zip twice is a later-round cache question, not a reason to pick B.

---

❓ **Q2** - **Live folder: overlay or replace? Partial extract?**

On a successful fetch, `/workspace/bots/<slug>/` must match the Release. On failure, CreateAgent must not run on a half-written tree (skill: no partial “good enough” persona).

Today’s skill says **overwrite files in place**. If v1.2.0 deletes `skills/old.md`, overlay **leaves** `old.md`. If the zip dies after three files, the live folder is a mix, and a naive `RELEASE` write would lie.

**A.** **Overlay in place.** Write files as they come; leave files the new tree does not mention. Write `RELEASE` at the end if `profile.md` exists, even if some members failed.

**B.** **Overlay in place**, but **fail closed**: any extract error → do not update `RELEASE`; leave the mixed folder as-is (caller must not CreateAgent).

**C.** **Atomic replace.** Extract the slug into a temp dir; require `profile.md`; then swap over `/workspace/bots/<slug>/` so the live folder is exactly the shipped tree (removed files gone). Write `RELEASE` (`tag_name` only, unless Q4 adds more) **only after** the swap. On failure, leave the previous live folder untouched (or absent).

➡️ **C.** The installed blueprint is a snapshot of one Release, not a union of Releases. Upgrade must drop vanished skills. Fail closed without poisoning the previous good snapshot. Matches “old snapshots stay on GitHub, not in versioned subfolders.”

---

❓ **Q3** - **Auth on the installer computer?**

The repo is public. The Grok computer may or may not have `gh` / a `GITHUB_TOKEN`. Fetch must not become “clone my private fork.”

**A.** **Anonymous HTTPS** to `api.github.com` + zipball. No token required. 401/403/429 → fail, say so, **do not** fall back to `main` or a cache of unknown origin.

**B.** **Require** a GitHub token (or logged-in `gh`) on every fetch.

**C.** Anonymous first; if rate-limited, **prompt the user** to paste a token and retry.

➡️ **A.** Layish’s repo is public; requiring auth makes first-run fragile (new users will not have a PAT in the bot computer). Token-gated fetch is a later problem if GitHub throttles us. C mixes credentials into Agora chat — out of scope for a fetch contract.

---

❓ **Q4** - **Integrity: tag name only, or also a commit?**

`RELEASE` is specified as a single line `tag_name` (e.g. `v1.2.0`). GitHub source zips are not a separate signed artifact. Tags can be moved (unusual, not impossible).

**A.** Trust GitHub HTTPS. `RELEASE` is **only** `tag_name`. No checksum.

**B.** After resolving `/releases/latest`, also record the Release’s **target commit SHA** (from the API). `RELEASE` still key-compares by `tag_name` for “stale vs latest” (ADR 0008). SHA is for humans/debug/upgrade notes, not a second pin.

**C.** We attach a **sha256** (or similar) on the GitHub Release and refuse the zip if it does not match. No checksum file → fail.

➡️ **A** for v1. Moving tags is rare; a checksum file is process we will skip on the first Release; SHA in `RELEASE` can wait until an upgrade skill needs it. Do not block fetch on a file we have never published. If you want cheap forensics without process, pick **B** — it does not change “latest tag wins.”

---

❓ **Q5** - **If `RELEASE` already equals latest, does fetch still download?**

Callers already skip: `need-bot` no-ops when `RELEASE` equals latest; first-run should not re-CreateAgent. The subroutine itself can be dumb or smart.

**A.** **Dumb pull.** Fetch always resolves latest, downloads, and writes (per Q2). Callers decide when to invoke it. An explicit upgrade **Yes** is just “run fetch again.”

**B.** **Smart no-op.** If `/workspace/bots/<slug>/RELEASE` equals latest `tag_name`, fetch does not download and reports “already current.” Callers that need a rewrite pass a force flag (later).

**C.** Smart no-op **unless** `profile.md` is missing — then fetch even if `RELEASE` matches (repair).

➡️ **A.** Keep one job: materialize this slug from this Release. Idempotency and repair live in `need-bot` / first-run. C is a repair skill, not fetch. B needs a force flag that does not exist yet.

---

❓ **Q6** - **Non-latest tag (restore / pin) in v1?**

ADR 0007: the Agora skill does not pin a version forever; default is latest. The skill draft also allows a **caller-named existing tag** (“restore”). Glossary: upgrade compares recorded release to a newer latest.

**A.** **v1 = latest only.** Fetch refuses any tag that is not GitHub `releases/latest`. Restore / downgrade / pin is a later skill. (A Release disappearing still fails closed.)

**B.** Default latest, but the **caller** (not the user in chat) may pass an existing tag for restore. No user syntax like `need Mneme@v1.0.0` in v1.

**C.** Users may request a tag (`need Mneme@v1.0.0` or similar) in v1.

➡️ **A.** Restore is a new product surface (who is allowed, what to write in `RELEASE`, how it interacts with “ask before refresh”). Shipping it inside fetch now fights ADR 0007’s “don’t pin in the skill.” Keep the draft’s restore sentence **out** of v1. B/C wait until an upgrade/restore grill.

---

## After this round (do not answer now)

- Share one zipball across Euodia + Mneme in first-run (depends on Q1).
- Exact `RELEASE` file grammar if Q4 is B or C.
- User-visible error strings; GitHub 404 “no Release yet.”
- Zip size / timeout.
- Whether a later **prerelease** channel exists (today `/latest` ignores them — leave that).
- Repair: bot exists, folder missing (or the reverse). Likely `need-bot`, not fetch.

---

## Glossary / ADR after close

When round 1 is answered: tighten **installed blueprint** / **blueprint release** if Q2/Q4 change what `RELEASE` means. Offer a short ADR only if the wire format (Q1) or atomic replace (Q2) should surprise a future reader — both likely qualify once chosen. Do **not** write those ADRs in this PR.
