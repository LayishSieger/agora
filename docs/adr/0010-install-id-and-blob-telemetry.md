# ADR 0010 — Install id registration, Blob, not open GET

Open `/t` would let anyone append CreateAgent rows. A shared secret in Agora’s public skill would leak. We still need an Agora-installation meter (template Add is not an **install event**).

**Decision:** Client mints an **install id**, writes `/workspace/bots/INSTALL_ID` first, then `GET /r?agora=1&id=` upserts it. `GET /t` records **install events** only when `event=install` and the id is already registered. Host: new Vercel project on this repo; registry and rows on private Blob (owner read). `DO_NOT_TRACK` skips `/r` and `/t`. Telemetry failure never blocks CreateAgent; `/t` is one-shot; register retries the same local id. Agora registration counts stay **untrusted** until rate-limit exists.

Rejected: open GET; secret-in-skill; server-minted ids (lost body double-registers); register-on-`/t` (spam mints ids again); SQL or logs-only for v1.
