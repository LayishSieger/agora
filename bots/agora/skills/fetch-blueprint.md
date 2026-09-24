---
name: Fetch blueprint
description: >-
  Use when Agora must pull a career-fleet bot tree from the latest GitHub
  Release of layishsieger/agora onto the Grok computer. Writes
  /workspace/bots/<slug>/ plus RELEASE. Never fetch main. Never CreateAgent.
---

# Fetch blueprint

Pull **one** named fleet bot’s files from GitHub onto this computer. Do not create a bot. Do not write career files under `/workspace/agora/`.

## Roster slugs

| Name (need / CreateAgent) | Repo and install folder |
|---|---|
| Euodia | `bots/euodia/` → `/workspace/bots/euodia/` |
| Mneme | `bots/mneme/` → `/workspace/bots/mneme/` |
| Zetesis | `bots/zetesis/` → `/workspace/bots/zetesis/` |
| Hermeneia | `bots/hermeneia/` → `/workspace/bots/hermeneia/` |
| Kairos | `bots/kairos/` → `/workspace/bots/kairos/` |
| Melete | `bots/melete/` → `/workspace/bots/melete/` |
| Peitho | `bots/peitho/` → `/workspace/bots/peitho/` |

Unknown name → stop. Do not guess a folder.

## Source

Repo: `https://github.com/LayishSieger/agora`

1. Resolve **latest GitHub Release** (`/repos/LayishSieger/agora/releases/latest`).
2. Record `tag_name` (e.g. `v1.2.0`). That is the **blueprint release**.
3. Download that release’s zip (tag archive). Extract the **whole** `bots/<slug>/` tree (profile, skills, prompts, guides, schemas, README — whatever is there).
4. If there is **no** Release, **fail**. Say so. **Do not** clone or fetch `main`.

## Write

Destination: `/workspace/bots/<slug>/` (Grok computer). Overwrite that folder’s tracked blueprint files for this fetch.

Write `/workspace/bots/<slug>/RELEASE` as a single line: the `tag_name`.

Do not create version subfolders (`v1.2.0/`). Old snapshots stay on GitHub Releases; to restore an old one, fetch **that** tag into the same folder (only when a caller asked for a non-latest tag).

Default callers (`need-bot`) always want **latest**.

## Return

To the caller:

- slug
- tag_name
- path `/workspace/bots/<slug>/`
- whether `profile.md` and `skills/*.md` exist

If `profile.md` is missing, fail. A stub README-only folder is not a creatable blueprint (Euodia until grilled).
