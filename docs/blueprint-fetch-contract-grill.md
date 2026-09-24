# Grill — Blueprint fetch contract

Status: **v1 closed.** Rounds 1–2 answered. Enough to author. **Do not implement** until Layish says **implement**.

This is the contract for **blueprint fetch**: bytes from GitHub → disk on the Grok computer. It is **not** CreateAgent, not skill enable, not first-run greeting, not `need` parsing, not install telemetry.

`bots/agora/skills/fetch-blueprint.md` is still a **steward draft** (restore sentence and in-place overwrite are wrong). Align that skill only at **implement**.

---

## Settled (do not re-ask)

| Decision | Where |
|---|---|
| Latest published GitHub Release, not `main`; no pin; v1 no restore | ADR 0007, F-R1-Q6 **A** |
| `RELEASE` is `tag_name` only; trust GitHub HTTPS | ADR 0007, F-R1-Q4 **A** |
| Path `/workspace/bots/<slug>/` + `RELEASE`; no versioned subfolders | ADR 0008 |
| Career SoT `/workspace/agora/`; fetch never writes it | ADR 0005 / 0008 |
| Existing bot: no second CreateAgent; ask before refresh if stale | ADR 0008 |
| Fetch is not an install event | glossary |
| One roster slug on disk. Not Agora. Not `apps/` / `docs/` | skills |
| No `profile.md` → fail (`missing_profile`). README-only is not creatable | F-R2-Q3 **B** |
| No invent / gist / paste / fork / `main` fallback | F-R1-Q3 **A** |
| Wire: source zipball; extract `bots/<slug>/` only | F-R1-Q1 **A**, ADR 0010 |
| Same turn may reuse zipball bytes for that latest tag; no cross-turn cache | F-R2-Q2 **B**, ADR 0010 |
| Regular files and directories only; reject all symlinks; do not execute the zip | F-R2-Q4 **A**, ADR 0010 |
| Atomic replace; `RELEASE` after success; previous snapshot untouched on failure | F-R1-Q2 **C**, ADR 0011 |
| Anonymous HTTPS; 401/403/429 → `http`; no token | F-R1-Q3 **A** |
| Dumb pull; callers decide when to invoke | F-R1-Q5 **A** |
| Each fetch resolves latest independently; mixed tags allowed | F-R2-Q1 **A**, ADR 0013 |
| Fail reasons (closed): `no_release` · `http` · `bad_archive` · `missing_profile` | F-R2-Q3 **B**, ADR 0012 |

Consequence of atomic replace: extras under `/workspace/bots/<slug>/` are gone after a successful fetch. Career files belong under `/workspace/agora/`.

Reuse + mixed tags: reuse only if the second resolve still sees the **same** latest tag as the bytes already in memory; otherwise GET again.

---

## Facts

- Public repo. Zero Releases → `no_release` (404). Fail closed until a Release exists.
- Source zipball exists with no Release assets.
- `/releases/latest` ignores drafts and prereleases (leave a prerelease channel out of v1).
- Zip prefix is GitHub’s first path component; do not hardcode it.
- `RELEASE` is not in the GitHub tree; written after swap.
- `FIRST_RUN` `tag=` is a first-run marker at implement (e.g. Mneme’s tag or last success), not a shared snapshot (ADR 0013).
- Doc-only branch: Vercel `agora` preview may ERROR (`apps/telemetry` lives on the telemetry branch).

---

## Design tree (v1 complete)

```
fetch contract
├── wire zipball ✓
│   ├── member types (regular files/dirs, no symlinks) ✓
│   └── same-turn zip reuse ✓
├── atomic replace ✓
├── anonymous HTTPS ✓
├── RELEASE = tag_name ✓
├── dumb pull ✓
├── latest only, no restore ✓
├── per-slug latest (mixed tags ok) ✓
└── closed fail reasons ✓
```

Not v1 fetch (do not grill now): error-string copy, zip size/time caps, bot-without-folder repair (`need-bot`), restore/pin skill, prerelease channel, telemetry, CreateAgent.

---

## Round 1 (answered)

| ID | Answer |
|---|---|
| F-R1-Q1 | **A** — source zipball; extract only `bots/<slug>/` |
| F-R1-Q2 | **C** — atomic replace; `RELEASE` after success; previous snapshot untouched |
| F-R1-Q3 | **A** — anonymous HTTPS; no `main` fallback |
| F-R1-Q4 | **A** — `RELEASE` is only `tag_name` |
| F-R1-Q5 | **A** — dumb pull |
| F-R1-Q6 | **A** — latest only; restore later |

---

## Round 2 (answered)

| ID | Answer |
|---|---|
| F-R2-Q1 | **A** — each fetch resolves latest independently; mixed tags allowed |
| F-R2-Q2 | **B** — same turn may reuse zipball bytes for that latest tag; no cross-turn cache |
| F-R2-Q3 | **B** — `no_release` · `http` · `bad_archive` · `missing_profile` |
| F-R2-Q4 | **A** — regular files and directories only; reject all symlinks; do not execute the zip |

---

## Author at implement (not open product questions)

- Rewrite `fetch-blueprint.md` to this contract (drop restore; atomic replace; fail reasons; symlink reject; same-turn reuse).
- One-line user copy per fail reason.
- `first-run.md`: `no_release`/`http`/`bad_archive` fail both; `missing_profile` on Euodia → `FAILED` and continue; `FIRST_RUN` `tag=` from a successful fetch (prefer Mneme).
- `need-bot.md`: same reasons; still no CreateAgent on fetch fail.
