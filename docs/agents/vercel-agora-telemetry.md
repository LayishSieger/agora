# Vercel — Agora install telemetry

Created during implement (2026-09-24). Not a product ADR.

| Item | Value |
|---|---|
| Team | Layish Sieger's projects |
| Project | `agora` (`prj_QRkjVAm1XHIrG4CapldKboqWlSyG`) |
| Root directory | `apps/telemetry` |
| Production URL | https://agora-layish-siegers-projects.vercel.app |
| Blob | `agora-telemetry` (private), env `BLOB_READ_WRITE_TOKEN` |
| Deployment protection | Vercel Auth on **preview only** so Agora can `GET /r` and `GET /t` unauthenticated |

## If something is missing (Layish)

1. Confirm GitHub is connected: Vercel → `agora` → Settings → Git → `LayishSieger/agora`.
2. Confirm Blob is linked: Storage → `agora-telemetry` → connected to `agora` (production + preview).
3. Do **not** turn on Vercel Authentication for production (Agora has no login).
4. After this PR merges to `main`, a production deploy from `main` should replace the branch deploy.

## Previews need a Next app

Project **Root Directory** is `apps/telemetry`. Branches that only have the stub README (no `package.json`, no `app/`) fail with `Couldn't find any `pages` or `app` directory`.

- Previews need `apps/telemetry/package.json` (and `app/`) on the branch, **or**
- The project **Ignored Build Step** should skip when `apps/telemetry/package.json` is missing (`exit 0` skip / `exit 1` continue).

This branch ships the real app, so ignore should **continue** and the preview should **build**. Do not create a second Vercel project.

Firewall rate-limit is **out of v1**. Treat Agora registration counts as untrusted.
