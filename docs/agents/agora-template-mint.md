# Mint checklist — public Agora installer template

Layish publishes the Add link. Do **not** Publish from a working/dev Agora. This is not a live `x.ai/bot/…` mint by the agent.

Facts: `docs/agents/grok-bot-install-facts.md`. Update-same-URL: `docs/agents/grok-share-template-update.md`. Product: ADR 0004, ADR 0015, `docs/thin-public-template-grill.md`.

## Source bot

1. **Create a new empty** Grok Bot. Identity / display name: **`Agora`** (no Greek in the name field).
2. Never Duplicate a staging bot. Never Publish the career-chat working box.

## Recipe fields (frozen Add snapshot)

| Field | Value |
|---|---|
| Name | `Agora` |
| Instructions / description | Verbatim `bots/agora/profile.md` (Add preview **is** this text) |
| Skills (public / first-party, enabled) | `bots/agora/skills/first-run.md`, `need-bot.md`, `fetch-blueprint.md` |
| Memories | **None** (strip if the UI added any) |
| Routines | **None** |
| Plugins / MCP / scripts | **None** (anonymous HTTPS zipball; no GitHub or Cursor reconnect) |
| Visibility | **Public** share link `https://x.ai/bot/…`. Gallery listing is optional, not a v1 gate |

Do **not** enable `prompts/out-of-scope.md` as a fourth Grok skill. First-run fetches that tree onto `/workspace/bots/agora/` (ADR 0015).

## Telemetry (first mint)

**Skip.** This recipe has **no** telemetry client bytes (no public `/r` `/t` URL, no `INSTALL_ID` mint in skills). `first-run` / `need-bot` skip `/r` and `/t` until a later **Update template** ships those files. Do not paste a host by hand.

## Publish

Share → Create template → **Publish** public. Recipients Add from the link (they need the Grok Bot app). Already-added copies are not live-pushed.

After Add, the first model turn runs first-run (profile + skill description). No extra routine.

## When to Update template

Click **Update template** (same URL, new Adds only) **only** when shipped `bots/agora/` **recipe** files change: `profile.md` or the three enabled skills.

- Child-only GitHub Releases (Euodia/Mneme/execution blueprints) do **not** bump the template.
- Adding telemetry client bytes **is** a recipe change → Update template then.
- Disk playbooks under `bots/agora/prompts/` move on Releases via self-materialize; they do not by themselves require Update template.

## After Publish

Record the public URL somewhere Layish owns (not in this repo until you choose to). Do not treat template Add as an install event.
