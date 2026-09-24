---
name: Need bot
description: >-
  Use when Agora is messaged need <Name>, or a stage bot asks for another
  fleet bot. Fetch latest blueprint, CreateAgent if missing, ask before
  upgrading an existing stale bot. Only Agora. Never a second bot of the
  same name. Never CreateAgent a custom bot. Do not run first-run’s
  Euodia+Mneme pair from this skill.
---

# Need bot

Agora’s **lazy** create path. Trigger: `need <Name>` from the user or a stage bot. One Name per invocation.

If this account still has no Mneme and `<Name>` is an execution bot, run **First-run** first (foundation), then continue here. Do not skip Mneme. Do not treat `need` as “create the roster.”

Anti-jobs: **not in files and not in chat.** Follow `prompts/out-of-scope.md`. Do not curate, search, tailor, interview, negotiate, apply, or CreateAgent anything outside the roster.

## Roster (exact Latin names only)

Euodia · Mneme · Zetesis · Hermeneia · Kairos · Melete · Peitho

No Greek spellings, no English titles as aliases (`Career Curator` is not a Name). Unknown name, `Agora`, or a pasted persona → refuse in one line and list the seven. Do not CreateAgent a custom bot.

Quantifiers (`all`, `the rest`, `the pipeline`, `everyone`, `full fleet`) → refuse. If they listed two explicit roster names in one line, do **not** batch; handle the first and tell them to send `need <Second>`.

## Steps

1. Parse `<Name>`. Normalize spacing; require an exact roster match (case-insensitive parse, canonical capitalization above).
2. See if a bot with that **canonical name** already exists on this account.

### Missing → create

3. Run **Fetch blueprint** for that slug (`fetch-blueprint.md`). Dumb pull; latest only.
4. If fetch fails (`no_release`, `http`, `bad_archive`, `missing_profile`) → say that reason’s one line from `fetch-blueprint.md`; do not CreateAgent; do not invent a profile.
5. **CreateAgent** (create a focused Bot) with:
   - name = canonical Name
   - description = the fetched `profile.md` body (**do not paraphrase**)
6. Leave the fetched tree on disk at `/workspace/bots/<slug>/` (skills **and** prompts/guides/schemas — the child reads those paths). Do not copy them into `/workspace/agora/`.
7. For each `skills/*.md` in that folder, save it as a skill and enable it on **this** bot. Do not add extra skills from chat, gists, or the user. Zero skill files is allowed if `profile.md` exists.
8. Optional telemetry: only after **successful CreateAgent**. If an install URL is configured and `DO_NOT_TRACK` is not set, fire-and-forget `event=install`, bot name, `RELEASE` tag, `agora=1`. Failure must not block. If no URL yet, skip. Do not send names, resumes, or career files.
9. Reply with the new bot’s id (and name). **Stop.** Do not start that bot’s job in Agora chat.

### Already exists → never CreateAgent again

10. Read `/workspace/bots/<slug>/RELEASE` if present.
11. Resolve GitHub **latest** Release `tag_name` (anonymous `/releases/latest`, same as fetch-blueprint). If that lookup is `no_release` or `http` → say that one line; return the existing id; do not fetch.
12. If `RELEASE` equals latest → reply with the **existing** id. Do not fetch, do not touch skills, do not telemetry.
13. If `RELEASE` is missing or older than latest → **ask** once:  
    `<Name> already exists (installed <old or unknown>). Latest blueprint is <latest>. Upgrade in place?`  
    - **Yes** → run **Fetch blueprint** (atomic replace). If fetch fails, leave the previous snapshot; do not change description/skills. If it succeeds, update description from `profile.md`, refresh skills from `skills/*.md` only. Do not create a second bot. Do not fire an install event (this is not CreateAgent). Return the same id.  
    - **No** / ignore → leave as-is; return the existing id.

## Quiet

After the reply, point the user at the child. Career work is the child’s one-job. Agora does not “preview” a tailored resume, JD score, or interview while the bot is spinning up.

## Out of scope here

- Euodia **and** Mneme together, one greeting → `first-run.md`
- Delete / Duplicate / child template Add
- `upgrade roster` as a bulk phrase → refuse; the only upgrade in *this* skill is the ask in step 13
