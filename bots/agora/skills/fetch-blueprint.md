---
name: Fetch blueprint
description: >-
  Use when Agora must pull one roster bot’s tree from the latest GitHub
  Release of LayishSieger/agora onto the Grok computer. Writes
  /workspace/bots/<slug>/ plus RELEASE. Never fetch main. Never CreateAgent.
  Never write /workspace/agora/ career files.
---

# Fetch blueprint

Pull **one** named fleet bot’s files from GitHub onto this computer. Do not create a bot. Do not install skills. Do not send telemetry. Do not greet. Do not write career files under `/workspace/agora/`.

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

Unknown name, `Agora`, or any other folder (`apps/`, `docs/`, …) → **stop**. Do not guess. Do not fetch the whole repo.

## Source

Repo: `https://github.com/LayishSieger/agora`

1. Resolve **latest GitHub Release** via `GET /repos/LayishSieger/agora/releases/latest` (GitHub’s latest **published** release; not a draft, not a prerelease, **not** `main`).
2. Record `tag_name` (e.g. `v1.2.0`). That is the **blueprint release**.
3. Download that tag’s source zip (`archive/refs/tags/<tag_name>.zip`).
4. If there is **no** Release, the API errors, or the zip fails → **fail**. Say so. **Do not** clone, fetch `main`, float on a branch, or use a gist/paste/fork.
5. Non-latest tag: only when the **caller** named a specific existing tag (restore). Default callers (`first-run`, `need-bot`) always want **latest**.

## Extract (fail closed)

Zip members look like `<repo>-<tag>/bots/<slug>/…`. Extract **only** entries whose path is exactly that prefix for this slug.

- Reject `..`, absolute paths, symlinks that escape `/workspace/bots/<slug>/`, and any path not under `bots/<slug>/`.
- Take the **whole** tree that is there: `profile.md`, `skills/`, `prompts/`, `guides/`, `schemas/`, README — whatever shipped. Do not invent missing files. Do not execute anything in the zip.
- If `profile.md` is missing after extract → **fail**. A stub README-only folder is not a creatable blueprint.

## Write

Destination: `/workspace/bots/<slug>/` (Grok computer). Overwrite that folder’s blueprint files for this fetch.

Write `/workspace/bots/<slug>/RELEASE` as a single line: the `tag_name`. No version subfolders (`v1.2.0/`). Old snapshots stay on GitHub Releases.

Do not write `/workspace/agora/` (career SoT). Do not write `/workspace/bots/FIRST_RUN` (that is first-run). Do not enable skills here.

## Return

To the caller:

- slug
- tag_name
- path `/workspace/bots/<slug>/`
- whether `profile.md` and `skills/*.md` exist

On failure: no CreateAgent, no partial “good enough” persona from chat.
