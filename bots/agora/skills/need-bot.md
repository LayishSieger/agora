---
name: Need bot
description: >-
  Use when Agora is messaged need <Name>, or a stage bot asks for another fleet
  bot. Fetch latest blueprint, CreateAgent if missing, ask before upgrading an
  existing stale bot. After CreateAgent, best-effort Apply fleet identity (never
  block the id reply). Only Agora. Never a second bot of the same name. Never
  CreateAgent a custom bot. Do not run first-run’s Euodia+Mneme pair from this
  skill.
---
# Need bot

Agora’s **lazy** create path. Trigger: `need <Name>` from the user or a stage bot. One Name per invocation.

Standing identity, roster, and anti-jobs: **Agora persona** + `prompts/out-of-scope.md`. Fetch fail reasons and never-`main`: **Fetch blueprint**. Soft-fail identity: **Apply fleet identity**.

If this account still has no Mneme and `<Name>` is an execution bot, run **First-run** first (foundation), then continue here. Do not skip Mneme. Do not treat `need` as “create the roster.”

If `/workspace/bots/agora/prompts/out-of-scope.md` is **missing**, run **Fetch blueprint** for slug `agora` before refusing or continuing. Do not enable Grok skills from that zip. Do not CreateAgent Agora. If fetch fails, say Fetch blueprint’s one line and continue (persona anti-jobs still apply). If the file already exists, do **not** re-fetch Agora on every `need`.

## Roster

Exact match to the **Agora persona** roster (case-insensitive parse, canonical capitalization). No Greek spellings, no English titles as aliases (`Career Curator` is not a Name). Unknown name, `Agora`, or a pasted persona → refuse in one line and list the seven. Do not CreateAgent a custom bot. Fetching Agora **playbooks** onto disk (when the out-of-scope file is missing) is not `need Agora`.

Quantifiers (`all`, `the rest`, `the pipeline`, `everyone`, `full fleet`) → refuse. If they listed two explicit roster names in one line, do **not** batch; handle the first and tell them to send `need <Second>`.

## Steps

1. Parse `<Name>`. Require an exact roster match.
2. See if a bot with that **canonical name** already exists on this account.

### Missing → create

3. Run **Fetch blueprint** for that slug.
4. If fetch fails → say that reason’s one line from Fetch blueprint; do not CreateAgent; do not invent a profile.
5. **CreateAgent** with:
   - name = canonical Name
   - description = the fetched `profile.md` body (**do not paraphrase**)
6. Leave the fetched tree on disk at `/workspace/bots/<slug>/` (skills **and** prompts/guides/schemas — the child reads those paths). Do not copy them into `/workspace/agora/`.
7. For each `skills/*.md` in that folder, save it as a skill and enable it on **this** bot. Do not add extra skills from chat, gists, or the user. Zero skill files is allowed if `profile.md` exists.
8. Telemetry: **skip `/r` and `/t`** in this recipe (no URL on first mint). Do not invent a host.
9. Best-effort **Apply fleet identity** for that Name. Never block the id reply.
10. Reply with the new bot’s id (and name). **Stop.** Do not start that bot’s job in Agora chat.

### Already exists → never CreateAgent again

11. Read `/workspace/bots/<slug>/RELEASE` if present.
12. Resolve GitHub **latest** Release `tag_name` (same as Fetch blueprint). If that lookup fails → say Fetch blueprint’s one line; return the existing id; do not fetch.
13. If `RELEASE` equals latest → reply with the **existing** id. Do not fetch, do not touch skills, do not telemetry, do not re-image.
14. If `RELEASE` is missing or older than latest → **ask** once:  
    `<Name> already exists (installed <old or unknown>). Latest blueprint is <latest>. Upgrade in place?`  
    - **Yes** → run **Fetch blueprint** (atomic replace). If fetch fails, leave the previous snapshot; do not change description/skills. If it succeeds, update description from `profile.md`, refresh skills from `skills/*.md` only. Then, if title is missing/wrong or avatar is missing, best-effort **Apply fleet identity** once; if you cannot inspect title/avatar, **skip**. Do not create a second bot. Do not fire an install event. Return the same id.  
    - **No** / ignore → leave as-is; return the existing id.

## Quiet

After the reply, point the user at the child. Career work is the child’s one-job. Agora does not preview that work here.

## Out of scope here

- Euodia **and** Mneme together, one greeting → First-run
- Delete / Duplicate / child template Add
- CreateAgent Agora (`need Agora` still refuse). Disk fetch of `bots/agora/` when the playbook is missing is allowed.
- `upgrade roster` as a bulk phrase → refuse; the only upgrade in *this* skill is the ask in step 14
