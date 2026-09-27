---
name: Apply fleet identity
description: >-
  Agora-owned only. After CreateAgent, or Agora itself on first-run:
  set the locked title chip and avatar for one Name. Prefer
  bots/<slug>/avatar.png from the installed blueprint; else geometric
  fallback. Best-effort — never block CreateAgent, foundation, or
  greeting. Children do not own this skill and do not brand themselves.
---

# Apply fleet identity

Set **title** + **avatar** for **one** fleet Name (Agora or a roster child). Not CreateAgent. Not fetch (callers already fetched). Not greeting. Not career work.

**Agora-owned.** Do not add this skill to children. Do not teach Euodia/Mneme/execution job skills about avatars.

## When

Callers: **First-run** (Agora self, then each child this turn actually CreateAgent’d) and **Need bot** (after a successful CreateAgent; optionally after upgrade-in-place if title/avatar is missing).

Never run as a user-facing chat job. Never change the first-run greeting.

## Never block

Identity is **best-effort**. CreateAgent, foundation, `/r`/`/t` skip, the id reply, and the greeting **always continue** if this skill fails.

Soft fail: **one line max**, then stop this skill. Do not retry. Do not dump tool errors. Do not invent a title or color.

## Maps (locked 26 Sep 2026)

Prefer `/workspace/bots/agora/prompts/identity-map.md` if that file exists. If it does not, use the tables below (Add snapshot). Do not invent rows. Unknown Name → stop this skill; say nothing.

### Title chips

| Name | Title |
|---|---|
| Agora | Career assembly |
| Euodia | Career pathfinder |
| Mneme | Career curator |
| Zetesis | Job finder |
| Hermeneia | Job decoder |
| Kairos | Resume tailor |
| Melete | Interview coach |
| Peitho | Offer negotiator |

### Geometric fallbacks

| Name | Shape | Color |
|---|---|---|
| Agora | shield | violet |
| Euodia | teardrop | cyan |
| Mneme | hex | blue |
| Zetesis | squircle | green |
| Hermeneia | wedge | yellow |
| Kairos | capsule | orange |
| Melete | cloud | magenta |
| Peitho | egg | red |

## Avatar file convention

Pre-authored in the repo / a later Release. **Not** generated on the steward path.

| Name | Repo path | Installed path after that slug’s fetch |
|---|---|---|
| Agora | `bots/agora/avatar.png` | `/workspace/bots/agora/avatar.png` |
| Euodia | `bots/euodia/avatar.png` | `/workspace/bots/euodia/avatar.png` |
| Mneme | `bots/mneme/avatar.png` | `/workspace/bots/mneme/avatar.png` |
| Zetesis | `bots/zetesis/avatar.png` | `/workspace/bots/zetesis/avatar.png` |
| Hermeneia | `bots/hermeneia/avatar.png` | `/workspace/bots/hermeneia/avatar.png` |
| Kairos | `bots/kairos/avatar.png` | `/workspace/bots/kairos/avatar.png` |
| Melete | `bots/melete/avatar.png` | `/workspace/bots/melete/avatar.png` |
| Peitho | `bots/peitho/avatar.png` | `/workspace/bots/peitho/avatar.png` |

If the installed file **exists**, install it as the avatar. If it is **missing**, still set the title; apply **shape / color** from the geometric table. Do **not** call live image generation. Do **not** fetch `main` or a second zip just for a missing png.

## Platform (title and avatar are on the target)

CreateAgent / UpdateAgent only set **name** and **description**. They do **not** set title or avatar.

**Hypothesis (treat as true in v1):** the parent cannot UpdateAgent another bot’s title or avatar. The **target** must apply those with its own profile tools.

- **Agora (self):** this bot **is** the target. Set title + image or geometric **on self**. Do not CreateAgent Agora. Do not UpdateAgent name/description here.
- **Child:** after CreateAgent, **SendToAgent** that child the mechanical steps below. Do **not** install this skill on the child. Do **not** try parent UpdateAgent for title/avatar. If SendToAgent is unavailable, soft-fail one line.

## Steps

1. Resolve canonical **Name** and slug (same table as `fetch-blueprint.md`). Look up **Title**, **shape**, **color**.
2. See whether `/workspace/bots/<slug>/avatar.png` is present.
3. **Agora:** on self, set title to **Career assembly**. If the png exists, install it as avatar; else set geometric **shield / violet**. Stop.
4. **Child:** SendToAgent `<Name>` with **only** these mechanical steps (no greeting, no job, no branding chat to the user):

   > Set your profile title to `<Title>`. If `/workspace/bots/<slug>/avatar.png` exists, install that file as your avatar. If it does not, set your geometric avatar to `<shape>` / `<color>`. Do not greet. Do not start your one-job. Reply with one line when done.

5. If the child never replies or tools fail → one-line soft fail; caller continues.

## Upgrade-in-place (Need bot only)

If the caller is refreshing an existing child: re-apply **only** when title is missing/wrong **or** there is no avatar (no image and no mapped geometric). If inspection is not possible, **skip** (do not re-install an image that may already be set). Never force a new image on every upgrade.

## Out of scope

- Publishing a Share pack
- Committing or generating pngs
- Changing child job skills
- Install telemetry
- User-facing branding in the first-run greeting
