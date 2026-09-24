---
name: Need bot
description: >-
  Use when Agora is messaged need <Name>, or a stage bot asks for another
  fleet bot. Fetch latest blueprint, CreateAgent if missing, ask before
  upgrading an existing stale bot. Only Agora. Never a second bot of the
  same name. Do not run first-run (Euodia+Mneme together) from this skill.
---

# Need bot

Agora’s lazy create path. Trigger: `need <Name>` from the user or a stage bot.

Anti-jobs: do not curate resumes, search jobs, tailor, interview, or CreateAgent anything outside this roster.

## Roster (exact Latin names only)

Euodia · Mneme · Zetesis · Hermeneia · Kairos · Melete · Peitho

No Greek spellings, no English titles as aliases. Unknown name → refuse in one line and list the seven. Do not CreateAgent a custom bot.

## Steps

1. Parse `<Name>`. Normalize spacing; require an exact roster match (case-insensitive parse, canonical capitalization above).
2. See if a bot with that **canonical name** already exists on this account.

### Missing → create

3. Run **Fetch blueprint** for that slug (`fetch-blueprint.md`).
4. If fetch fails (no Release, no `profile.md`) → tell the requester; do not CreateAgent.
5. **CreateAgent** (create a focused Bot) with:
   - name = canonical Name
   - description = the fetched `profile.md` body (do not paraphrase)
6. Leave files on disk at `/workspace/bots/<slug>/`.
7. For each `skills/*.md` in that folder, save it as a skill and enable it on **this** bot.
8. Optional telemetry: if an install URL is configured and `DO_NOT_TRACK` is not set, fire-and-forget `event=install`, bot name, `RELEASE` tag, `agora=1`. Failure must not block. If no URL yet, skip.
9. Reply with the new bot’s id (and name). Stop.

### Already exists → never CreateAgent again

10. Read `/workspace/bots/<slug>/RELEASE` if present.
11. Resolve GitHub **latest** Release `tag_name` (same as fetch-blueprint).
12. If `RELEASE` equals latest → reply with the **existing** id. Do not fetch, do not touch skills.
13. If `RELEASE` is missing or older than latest → **ask** once:  
    ` <Name> already exists (installed <old or unknown>). Latest blueprint is <latest>. Upgrade in place? `  
    - **Yes** → fetch latest into `/workspace/bots/<slug>/`, update description from `profile.md`, refresh skills from `skills/*.md`. Do not create a second bot. Then return the same id.  
    - **No** / ignore → leave as-is; return the existing id.

## Quiet

After the reply, do not start that bot’s job in Agora chat. Point the user at the child. Career work is the child’s one-job.

## Out of scope here

- Standing up Euodia **and** Mneme together on first install → later `first-run.md` (blocked until Euodia’s blueprint exists).
- Repair/upgrade as a separate user phrase (`upgrade roster`) → later skill; the only upgrade in *this* skill is the ask in step 13.
