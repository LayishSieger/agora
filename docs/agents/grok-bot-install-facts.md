# Facts — how a Grok Bot appears on an account (checked 2026-09-24)

Research for the Agora steward-skills grill. Not an ADR. Not a product decision.

Sources: [docs.x.ai Create and manage Bots](https://docs.x.ai/grok-bot/bots), [FAQ](https://docs.x.ai/grok-bot/faq), [Skills and routines](https://docs.x.ai/grok-bot/skills-routines-and-automations), [Cursor: Work with Grok Bot](https://cursor.com/docs/grok-bot/work), [x.ai guide: Templates for Grok Bot](https://x.ai/bot/guides/templates-for-grok-bot) (Matt Palmer, 8 Sep 2026).

## Documented ways a Bot is created

| Path | What you get | Official? |
|---|---|---|
| New → Create new Bot (or type a name) | Empty Bot; you set profile, then teach it | Yes |
| Existing Bot **suggests or creates a focused Bot** | A new Bot on the **same** account when a job needs a long-lived owner. Docs do **not** say this copies a public template or GitHub files | Yes |
| **Duplicate** a Bot | Copy of profile, settings, enabled skills, routines, avatar. Not history, learned memory, or attachments. Same account only | Yes |
| **Share / Create template** → `https://x.ai/bot/…` → **Add to Grok Bot** | Independent copy on the **recipient** account: identity, description, skills, routines. Not the creator’s computer, logins, or conversation history. Adding accepts third-party bot terms | Yes |

## Template Add (the share-link path)

- Creator: Share menu → Create template → Public or Team-only link. Enterprise/Teams admins can restrict public publish.
- Recipient: open preview on x.ai, review configuration, **Add to Grok Bot**. **They need the Grok Bot app to finish.** Official docs do **not** describe a Bot completing Add without that step.
- Template is a **recipe**, not a clone: first-party plugins/skills/instructions can ship; secrets, custom MCP, scripts, and (per the x.ai guide) **personal/private skills** do not.
- New copy still reconnects plugins. SpaceXAI does not verify third-party bots.

## What is **not** documented

Agora ADR 0004’s runtime path — HTTPS-fetch `bots/<name>/` from GitHub, **CreateAgent**, then install skills from markdown — is **this repo’s invention**. Docs never name `CreateAgent`. Closest official verbs: create a focused Bot, Duplicate, Add template.

That GitHub reconstruct **might work** on the shared computer. It is not the documented way to install a preconfigured third-party Bot. Template Add is.

## Implication for Agora (still a decision)

A new user who only added the thin **Agora** template does not have Mneme to Duplicate. An empty “focused Bot” would not carry Mneme’s skills. The documented way to give them a **preconfigured** Euodia/Mneme/Kairos is a **published template link** plus Add.

GitHub `bots/` can remain **authorship** (what Layish edits, then publishes/updates as Grok templates). It is a separate question whether Agora should **fetch** those files at install time.

Round 1 questions (GitHub zip locator, disk path, materialize private skills) stay **paused** until the install vehicle is decided.
