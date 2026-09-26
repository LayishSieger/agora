# ADR 0013 — Fetch fails with a closed set of reasons

Callers must branch: no GitHub Release means first-run cannot stand up the foundation; a missing Euodia `profile.md` must not block Mneme. Opaque “fetch failed” hides that split. A failed blueprint fetch reports exactly one of `no_release`, `http`, `bad_archive`, `missing_profile`. None of those may CreateAgent. One-line user copy lives in `bots/agora/skills/fetch-blueprint.md`. Extra log fields are out of v1.
