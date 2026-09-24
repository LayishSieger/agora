---
name: Install telemetry
description: >-
  Use on Agora’s first turn and before CreateAgent. Mint or reuse
  /workspace/bots/INSTALL_ID, GET /r to register, then after successful
  CreateAgent one-shot GET /t. Honor DO_NOT_TRACK. Never block create.
  Never mint a second id.
---

# Install telemetry

Two meters. **Agora registration** (`/r`) = this installer is in use. **install event** (`/t`) = successful CreateAgent. Not fetch. Not upgrade-in-place. Not template Add as CreateAgent.

Base (public): `https://agora-layish-siegers-projects.vercel.app`

If that host 404s, try the production alias on the Vercel project named `agora` (same `/r` and `/t`). Do not put the URL under `/workspace/agora/`.

## Do not track

If env `DO_NOT_TRACK` is set (any non-empty value) on this Grok computer: skip `/r` and `/t`. Still CreateAgent. Do not write `INSTALL_ID` only to skip later pings — if DNT is set, skip network; you may still write `INSTALL_ID` locally so a later turn with DNT unset reuses the **same** id (never mint a second). Prefer: if DNT set, do not mint; if a file already exists, leave it.

Simplest: **if DNT set, do not call `/r` or `/t`**. If `INSTALL_ID` is missing and DNT is set, do **not** mint (no row, no local id required). If the file already exists, leave it.

## Ensure registered (before CreateAgent)

Run at the **start** of first-run (even if fetch will fail; even if `FIRST_RUN` already exists) and at the start of need-bot **missing → create**.

1. If `DO_NOT_TRACK` is set → return. No network.
2. If `/workspace/bots/INSTALL_ID` exists and contains a UUID → use that string (trim, lowercase). Do **not** mint another.
3. Else mint a UUID v4. Write it as the only line of `/workspace/bots/INSTALL_ID` (Agora sole-writes). Create `/workspace/bots/` if needed. **Never** write this under `/workspace/agora/`. **Never** overwrite an existing file with a new UUID.
4. `GET {base}/r?agora=1&id={uuid}` and **wait** for 2xx. If it fails (network, 4xx, 5xx): keep the local file, continue the steward job, skip `/t` this turn. On a later turn, call `/r` again with the **same** id. Do not mint a second id.

## After successful CreateAgent (install event)

Only when CreateAgent returned an id. Skill enable may have failed. Not on upgrade-in-place. Not when the bot already existed.

1. If `DO_NOT_TRACK` is set → skip.
2. If no local UUID file → skip (do not mint here; Ensure registered should have run first).
3. If `/r` has not succeeded this installation (you never got 2xx for this id, including this turn) → skip `/t`. Next turn: Ensure registered again, then you may `/t` on a **new** CreateAgent only (do not replay old creates).
4. One-shot (ignore status, **never retry**, never queue):

   `GET {base}/t?event=install&bot={CanonicalLatin}&release={RELEASE tag}&agora=1&id={uuid}`

   Canonical Latin: Euodia, Mneme, Zetesis, Hermeneia, Kairos, Melete, Peitho. `release` = the `RELEASE` file / tag_name you just used.

5. Do not send bot ids, account, names, resumes, or career files. Failure must not block CreateAgent.

## Never

- Public read of Blob
- Second UUID
- `/t` without a registered id
- Blocking first-run or need-bot on telemetry
