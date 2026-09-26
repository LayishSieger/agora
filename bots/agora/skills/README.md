# Agora skills

- `first-run.md` — Materialize Agora playbooks, then CreateAgent Euodia + Mneme from latest Release; greet once; quiet. Mneme even if Euodia fetch fails (`missing_profile`); `no_release` / `http` / `bad_archive` fail both children.
- `need-bot.md` — `need <Name>` CreateAgent if missing / ask before refresh. One roster name. Never a custom bot. Never CreateAgent Agora. Re-fetch Agora playbooks only if `out-of-scope.md` is missing.
- `fetch-blueprint.md` — latest GitHub Release zipball → atomic `/workspace/bots/<slug>/` + `RELEASE`. Closed fail reasons. Slug `agora` is disk-only. No CreateAgent. No `main`. Do not enable Grok skills. No telemetry.

Supporting: `../prompts/out-of-scope.md` (hard refusals; fetched onto disk, not an Add skill).
