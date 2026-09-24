# Source capture — Grok share “Grok bot template update”

Captured 2026-09-24 from https://grok.com/share/bGVnYWN5LWNvcHk_0e90549c-9ac3-4f57-848d-10f4706ff9d7

This is a **Grok.com chat**, not an Agora ADR and not Layish’s letter answers unless he says he adopts it.

## User 1

If I publish a grok bot template and then want to update it does this mean a new link?

## Grok 1 (summary of visible answer)

No. **Update template** refreshes the same `https://x.ai/bot/…` link. New Adds get the new snapshot. People who already added it do **not** get a live push (install is a copy). A new template mint is a new link. Strip secrets before update.

## User 2

If I want to create a bot template that creates bots also from templates should this bot templates also be published or should I just instruct the main bot to create them in the app? From a blueprint source I will maintain in gh or similar. No a personal template but a specialized template

## Grok 2 (summary of visible answer)

**Publish the installer only.** Do not require every specialist as a published template. Keep specialist blueprints on GitHub; the installer **CreateAgent**s them in the user’s account.

Said reasons:

- Official templates do not nest. Add copies one bot. Multi-bot kits are an installer that CreateAgents the rest (claims this matches “Home” / catalog Setup bots).
- Publishing every child = many Add clicks and independent drift; git would fight a second frozen snapshot per child.
- Skills on an official template copy at add-time; they do not stay live-linked to the repo. Installer can re-fetch on upgrade.
- Child CreateAgent from fetched markdown is “enough.”

Installer behavior it prescribed:

1. User adds only the installer template.
2. Show roster; wait for explicit “stand up these N bots.”
3. Fetch each specialist from **pinned** raw GitHub URLs (tag/commit, not unpinned `main`).
4. CreateAgent from that file (name, job, never-list, first task). Do not paraphrase.
5. Cap the fleet (it suggested 2–4 as a common default).
6. After success, UpdateAgent the installer: drop install block; do not CreateAgent again.
7. Optional later `upgrade-roster` skill with approval.

Repo shape it prescribed: thin `installer/PROFILE.md`, `bots/<name>/PROFILE.md`, `roster.json`, tagged releases.

Publish a child template only if that specialist is useful **alone** and you will maintain that extra Update-template link. Even then, the installer should still create from git, not send the user on a chain of Add clicks.

**Bottom line in that chat:** for a specialized kit, publish the door; create the others from GitHub blueprints. Child templates are optional merchandising.

## Caution for Agora

This chat uses **CreateAgent** / **UpdateAgent** as if they were product commands. Official x.ai/Cursor Grok Bot docs (see `grok-bot-install-facts.md`) document Create new Bot, focused Bot, Duplicate, and template Add — they do not name those commands. Treat this share as **one advisor’s architecture**, not platform documentation.
