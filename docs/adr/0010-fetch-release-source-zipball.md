# ADR 0010 — Fetch the GitHub Release source zipball; install one slug only

CreateAgent needs one roster bot’s tree, not the whole repo on disk. Walking GitHub’s Contents API blows unauthenticated rate limits; custom Release assets add packaging we would skip. Layish chose the Release **source zipball** (`zipball_url` / `archive/refs/tags/<tag>.zip`) and extracting only `bots/<slug>/`. Anonymous HTTPS; 401/403/429 fail with no `main` fallback.
