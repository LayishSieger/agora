# Mint checklist — public Agora installer template

Layish publishes the Add link. Do **not** Publish from a working/dev Agora. This is not a live `x.ai/bot/…` mint by the agent.

Facts: `docs/agents/grok-bot-install-facts.md`. Update-same-URL: `docs/agents/grok-share-template-update.md`. Product: ADR 0004, ADR 0015, ADR 0016, `docs/thin-public-template-grill.md`.

## Source bot

1. **Create a new empty** Grok Bot. Identity / display name: **`Agora`** (no Greek in the name field).
2. Never Duplicate a staging bot. Never Publish the career-chat working box.

## Recipe fields (frozen Add snapshot)

| Field | Value |
|---|---|
| Name | `Agora` |
| Instructions / description | Verbatim `bots/agora/share-description.md` (**short** storefront). Do **not** paste `profile.md` here |
| Skills (public / first-party, enabled) | Six: First-run, Need bot, Fetch blueprint, Apply fleet identity, Install telemetry, Agora persona (`first-run.md`, `need-bot.md`, `fetch-blueprint.md`, `apply-fleet-identity.md`, `install-telemetry.md`, `agora-persona.md`). **No** separate Getting started skill |
| Share `gettingStarted` | Point at **First-run** (`gettingStarted.skill` = `First-run`). First conversation after Add is First-run, not a seventh pack skill |
| Geometric mark | **shield / violet** (public recipe) |
| Title chip | **Cannot** ship in the Share pack. First-run sets Agora title **Career assembly** once |
| Memories | **None** (strip if the UI added any) |
| Routines | **None** |
| Plugins / MCP / scripts | **None** (anonymous HTTPS zipball; no GitHub or Cursor reconnect) |
| Visibility | **Public** share link `https://x.ai/bot/…`. Gallery listing is optional, not a v1 gate |

Long identity is skill **Agora persona** (`agora-persona.md` = full `profile.md` body). Do **not** put the storefront blurb in that skill.

Do **not** enable `prompts/out-of-scope.md` or `prompts/identity-map.md` as extra Grok skills. First-run fetches that tree onto `/workspace/bots/agora/` (ADR 0015).

## Telemetry

**Included.** Enable skill **Install telemetry** (`bots/agora/skills/install-telemetry.md`). Public base URL is baked in that skill (`https://agora-layish-siegers-projects.vercel.app`). First-run / Need bot call Ensure registered (`/r`) before CreateAgent and one-shot `/t` after success. Honor `DO_NOT_TRACK`. Do not invent a different host.

If a public Add link was minted **before** this skill existed: click **Update template** (same URL) so **new** Adds get Install telemetry + the updated First-run / Need bot / Agora persona bytes. Already-added copies are not live-pushed.

## Publish

Share → Create template → **Publish** public. Recipients Add from the link (they need the Grok Bot app). Already-added copies are not live-pushed.

After Add, Share `gettingStarted` and the first conversation run **First-run** (skill description is the trigger). No extra routine. No Getting started skill. First-run applies title **Career assembly** and geometric **shield / violet** (or `bots/agora/avatar.png` if a later Release includes it).

## When to Update template

Click **Update template** (same URL, new Adds only) **only** when shipped `bots/agora/` **recipe** files change: `share-description.md`, `agora-persona.md`, or the other **enabled** skills (`first-run`, `need-bot`, `fetch-blueprint`, `apply-fleet-identity`, `install-telemetry`).

- Child-only GitHub Releases (Euodia/Mneme/execution blueprints, including later `avatar.png` files) do **not** bump the template unless an enabled Agora skill changed.
- Shipping or changing telemetry client bytes **is** a recipe change → Update template then.
- Disk playbooks under `bots/agora/prompts/` move on Releases via self-materialize; they do not by themselves require Update template.

## After Publish

Record the public URL somewhere Layish owns (not in this repo until you choose to). Do not treat template Add as an install event.
