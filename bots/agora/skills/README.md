# Agora skills

Six enabled Add skills. There is **no** separate Getting started skill. Share `gettingStarted` points at **First-run**.

- `first-run.md` — Materialize Agora playbooks, apply Agora fleet identity (best-effort), then CreateAgent Euodia + Mneme from latest Release (ListSections seating if a sidebar section is named Agora or Career); identity each created child (best-effort); greet once (no user `need` coaching); quiet. Mneme even if Euodia fetch fails (`missing_profile`); `no_release` / `http` / `bad_archive` fail both children. Share `gettingStarted.skill` = `First-run`. Calls **Install telemetry** before creates and after success.
- `need-bot.md` — Stage bot `need <Name>` (parse the text; do not coach the user). CreateAgent if missing / ask before refresh. ListSections seating when a sidebar section is named Agora or Career. After CreateAgent, best-effort Apply fleet identity. One roster name. Never a custom bot. Never CreateAgent Agora. Re-fetch Agora playbooks only if `out-of-scope.md` is missing. Do not run First-run’s Euodia+Mneme pair from this skill. Calls **Install telemetry** on missing → create.
- `fetch-blueprint.md` — latest GitHub Release zipball → atomic `/workspace/bots/<slug>/` + `RELEASE`. Closed fail reasons. Slug `agora` is disk-only. No CreateAgent. No `main`. Do not enable Grok skills. No telemetry.
- `apply-fleet-identity.md` — Agora-owned title chip + avatar (file or geometric). After CreateAgent / Agora self. Never blocks foundation. Children do not own this skill.
- `install-telemetry.md` — mint `INSTALL_ID`, `GET /r` before CreateAgent, one-shot `GET /t` after success. Honor `DO_NOT_TRACK`. Never blocks create.
- `agora-persona.md` — Standing identity: ONE JOB / roster / anti-jobs. Pointers to the other five skills. Not the Share storefront blurb.

Supporting: `../prompts/out-of-scope.md` (hard refusals; fetched onto disk, not an Add skill). `../prompts/identity-map.md` (title + geometric tables; also embedded in Apply fleet identity).
