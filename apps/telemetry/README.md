# Install telemetry

Vercel project **agora**, root `apps/telemetry`. Private Blob. **Owner-only** reads (dashboard/Blob). `GET /r` and `GET /t` write only. Agora registration counts are **untrusted** until rate-limit exists.

## Routes

| Method | Path | Effect |
|---|---|---|
| `GET` | `/r?agora=1&id=<uuid>` | Upsert **Agora registration**. 204. Idempotent. |
| `GET` | `/t?event=install&bot=<Latin>&release=<tag>&agora=1&id=<uuid>` | Append **install event** if `id` is registered. 204. 404 unknown id. |

Does not persist IP or User-Agent as product data. Cache-Control: `no-store`.

## Agora client (Grok computer)

See `bots/agora/skills/install-telemetry.md`. Base URL is baked there.

`DO_NOT_TRACK` (any non-empty value on the Grok computer) skips `/r` and `/t`.

## Blob layout

- `registry/<uuid>.json` — `{ id, agora: 1, ts }`
- `events/<uuid>/<ts>-<nonce>.json` — `{ event, bot, release, agora, id, ts }`

## Local

```bash
cd apps/telemetry
npm install
npm test
npm run build
```

Needs `BLOB_READ_WRITE_TOKEN` at runtime (Vercel Blob store attached to the project).
