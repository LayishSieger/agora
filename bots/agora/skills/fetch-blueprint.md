---
name: Fetch blueprint
description: >-
  Use when Agora must pull one roster bot’s tree from the latest GitHub
  Release of LayishSieger/agora onto the Grok computer. Writes
  /workspace/bots/<slug>/ plus RELEASE. Never fetch main. Never CreateAgent.
  Never write /workspace/agora/ career files. No telemetry.
---

# Fetch blueprint

Pull **one** named fleet bot’s files from GitHub onto this computer. Do not create a bot. Do not install skills. Do not send telemetry (`/r` or `/t`). Do not greet. Do not write career files under `/workspace/agora/`. Do not write `/workspace/bots/FIRST_RUN` or `INSTALL_ID`.

This skill is a **dumb pull**. Always resolve latest, download (unless same-turn reuse below), and write. Callers (`first-run`, `need-bot`) decide *whether* to invoke it. v1 is **latest only** — no restore, no caller-named older tag, no pin.

## Roster slugs

| Name (need / CreateAgent) | Repo tree → install folder |
|---|---|
| Euodia | `bots/euodia/` → `/workspace/bots/euodia/` |
| Mneme | `bots/mneme/` → `/workspace/bots/mneme/` |
| Zetesis | `bots/zetesis/` → `/workspace/bots/zetesis/` |
| Hermeneia | `bots/hermeneia/` → `/workspace/bots/hermeneia/` |
| Kairos | `bots/kairos/` → `/workspace/bots/kairos/` |
| Melete | `bots/melete/` → `/workspace/bots/melete/` |
| Peitho | `bots/peitho/` → `/workspace/bots/peitho/` |

Unknown name, `Agora`, or any other folder (`apps/`, `docs/`, …) → **stop**. Do not guess. Do not install the whole repo on disk.

## Fail closed (exactly one reason)

Return **one** of these to the caller. Never CreateAgent. Never invent a persona. Never fall back to `main`, a branch, a gist, a paste, or a fork. Leave the previous `/workspace/bots/<slug>/` **untouched** (or absent).

| Reason | When | One line to the user |
|---|---|---|
| `no_release` | `GET /repos/LayishSieger/agora/releases/latest` is 404 or there is no published Release | No published GitHub Release yet. I won’t fetch `main`. |
| `http` | 401, 403, 429, 5xx, network/timeout, or cannot write the temp/swap | GitHub (or disk) failed. Try later. I won’t fetch `main`. |
| `bad_archive` | Zip won’t open; path escape (`..`, absolute); **any symlink**; non-regular file; member outside `bots/<slug>/` | The Release archive was unusable. I won’t CreateAgent from it. |
| `missing_profile` | Slug prefix extracted but `profile.md` is missing (README-only stub is not enough) | No creatable `bots/<slug>/profile.md` in this Release. |

Do not invent extra reasons.

## Source (anonymous HTTPS)

Repo: `https://github.com/LayishSieger/agora`. No GitHub token. No `gh auth`.

1. `GET https://api.github.com/repos/LayishSieger/agora/releases/latest` (latest **published** Release: not draft, not prerelease, **not** `main`).
2. Read `tag_name` (e.g. `v1.2.0`). That is the **blueprint release**. `RELEASE` will be this string only — no commit SHA, no checksum.
3. Download that tag’s **source zipball**: `zipball_url` from the API, or `https://github.com/LayishSieger/agora/archive/refs/tags/<tag_name>.zip`. Do not require custom Release assets.
4. **Same-turn reuse:** if this Agora turn already downloaded a zipball for **this exact** `tag_name`, reuse those bytes. If `/releases/latest` now names a **different** tag, GET again. Do **not** cache the zip on disk across turns or chats.

## Extract (temp tree)

Zip members look like `<first-component>/bots/<slug>/…`. The first component is GitHub’s archive prefix — **do not hardcode it**. Strip it. Keep only `bots/<slug>/`.

Extract into a **new temp directory**, never into the live `/workspace/bots/<slug>/`.

- Regular **files and directories** only. Reject **all** symlinks (even if they would stay inside the slug), devices, and other specials. Do not execute anything in the zip.
- Reject `..`, absolute paths, and any path not under `bots/<slug>/`.
- Take the whole shipped slug tree (`profile.md`, `skills/`, `prompts/`, `guides/`, `schemas/`, README, other regular files). Do not invent files. Do not drop unknown regular files in that slug.

If `profile.md` is missing in the temp tree → `missing_profile`. Delete the temp dir. Do not swap.

## Write (atomic replace)

Destination: `/workspace/bots/<slug>/`. No version subfolders. Old snapshots stay on GitHub Releases.

1. Write `RELEASE` inside the **temp** tree as a single line: the `tag_name` (no SHA).
2. Swap the temp directory over `/workspace/bots/<slug>/` so the live folder **is** the shipped tree plus `RELEASE`. Removed upstream files are gone. Extras that were only on disk are gone.
3. If swap fails → `http`. Previous live folder untouched. Delete temp.

Do not write `/workspace/agora/`. Do not enable skills here.

## Return (success)

To the caller:

- slug
- `tag_name`
- path `/workspace/bots/<slug>/`
- `profile.md` present (required)
- whether `skills/*.md` exist

On any fail reason: no CreateAgent, no partial persona from chat, previous snapshot unchanged.
