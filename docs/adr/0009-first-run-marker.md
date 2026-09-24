# ADR 0009 — First-run marker lives with installed blueprints, not career files

First-run must greet once and retry a failed Euodia without asking Mneme’s files. We record completion at `/workspace/bots/FIRST_RUN` (Agora sole-writes) next to installed blueprints, not under `/workspace/agora/` (career SoT). Inferring “already greeted” from bot existence alone is wrong: `need Mneme` can create Mneme before any greeting.
