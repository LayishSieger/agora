---
name: First-run
description: >-
  Use on Agora’s first turn after template Add, or whenever Euodia or Mneme
  is still missing on this account. Fetch latest blueprints, CreateAgent
  Euodia and Mneme (Mneme even if Euodia fails), greet once, then quiet.
  Do not create execution bots. Do not write career files.
---

# First-run

Agora’s **foundation** create. Not lazy `need`. Not the whole pipeline.

Creates **Euodia** and **Mneme** only. Then greets **once**, points at those two, and stays quiet.

## When

Run this skill when `/workspace/bots/FIRST_RUN` is missing, or when Euodia or Mneme is still missing / recorded `FAILED` on this account.

If the user’s message is `need <Name>`, finish first-run (create what’s missing, greet only if never greeted) **then** hand off to `need-bot.md`.

If this skill already completed (`FIRST_RUN` has `greeted=yes` and both bots exist) → **do not** greet again. Do not CreateAgent again. Quiet, or one line that they already have Euodia and Mneme.

## Anti-jobs

Follow `prompts/out-of-scope.md`. Hard refuse in this chat:

- Create Zetesis → Peitho, “the rest,” “everyone,” “full fleet”
- Skip Mneme, skip standing up foundation because “I’ll use Euodia first”
- Write `/workspace/agora/` career files or empty scaffolds
- Interview, pathfind, tailor, search, or “while we set up, what’s your target role?”
- Invent an Euodia `profile.md` or skills when fetch fails
- Fetch `main`

Euodia is optional to **use**. Euodia is not a gate on **Mneme** (ADR 0003). If Euodia’s blueprint is missing, **still** CreateAgent Mneme.

## Steps

Each blueprint fetch **resolves latest on its own** (`fetch-blueprint.md`). Mixed `RELEASE` tags are allowed. Same-turn zipball reuse applies if both fetches see the same `tag_name`.

1. **Euodia** (always attempt, never required to succeed):
   1. If a bot named Euodia already exists → record its id; do not CreateAgent a second one; do not fetch.
   2. Else run **Fetch blueprint** for `euodia`.
      - `no_release`, `http`, or `bad_archive` → record `euodia=FAILED` and `mneme=FAILED`. **Do not** fetch Mneme. Do **not** greet as if install succeeded. Do not fetch `main`. Skip to writing `FIRST_RUN` with `greeted=no`.
      - `missing_profile` → record `euodia=FAILED`; **continue** to Mneme. Do not author a persona from memory.
   3. Else CreateAgent from fetched `profile.md` (verbatim), enable `skills/*.md` if any, telemetry as in need-bot (success only). Record id.
2. **Mneme** (required for a successful foundation):
   1. If a bot named Mneme already exists → record its id; do not duplicate; do not fetch.
   2. Else run **Fetch blueprint** for `mneme` (independent latest).
      - `no_release`, `http`, `bad_archive`, or `missing_profile` → record `mneme=FAILED`. Do **not** CreateAgent a fake Mneme. Do not greet as ready.
   3. Else CreateAgent from fetched `profile.md` (verbatim), enable every `skills/*.md`, leave prompts/guides/schemas on disk at `/workspace/bots/mneme/`. Telemetry on success. Record id.
3. Write `/workspace/bots/FIRST_RUN` (Agora sole-writes; **not** career SoT). Example:

   ```
   greeted=yes
   tag=v1.2.0
   euodia=<id-or-FAILED>
   mneme=<id-or-FAILED>
   ```

   `tag=` is a marker, not a shared snapshot: use Mneme’s successful fetch `tag_name` if you have one; else Euodia’s; else omit. Mixed tags on disk are fine.

   Set `greeted=yes` only after you send the greeting below (or if a previous file already had `greeted=yes` — never greet twice). If Mneme failed and you could not stand up foundation, set `greeted=no` and do not pretend the fleet is ready.
4. **Greeting** (once, only when `greeted` was not already `yes` and Mneme exists):

   > Euodia (direction, optional) and Mneme (career truth) are ready. Open Mneme to capture your record, or Euodia if you still need a direction. I stay out of that work — send `need <Name>` when you want a later stage.

   If Euodia `FAILED` but Mneme exists:

   > Mneme is ready — open it to capture your career record. Euodia isn’t installed yet (no creatable blueprint in this Release). I won’t pathfind here. Send `need Euodia` after a Release that includes `bots/euodia/profile.md`.

   Do **not** ask intake questions. Do **not** list execution bots as if they were already created.
5. Stop. Quiet unless `need` or a later steward ask.

## Retry

Later turns: if `euodia=FAILED` and Mneme exists, run Fetch blueprint for `euodia` only; CreateAgent if `profile.md` is now there. Do not re-greet. Do not re-create Mneme. If Mneme also failed (`no_release` / `http` / `bad_archive` / `missing_profile`), run this skill from the top.

## Never from this skill

- Execution bots
- Custom bots
- Upgrading stale execution bots (that’s `need-bot` step 13)
- A second greeting
