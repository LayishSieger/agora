# Euodia (eve)

Black-box [eve](https://eve.dev) agent for Euodia — career pathfinder (direction workshop only in this v1).

Seeded from Agora blueprints (`bots/euodia/profile.md`, `skills/clarify-direction.md`, `prompts/out-of-scope.md`). Does not write Mneme master files. Sandbox seeds an empty `/workspace/agora/` for career SoT reads when present.

## Prerequisites

- Node.js **24+**
- A model credential (ChatGPT / Vercel AI Gateway / OpenAI / Anthropic) — connect via the eve TUI `/login` or env keys

## Run locally

From this directory:

```bash
cd apps/euodia-eve
npm install
npm run dev
```

That runs `eve dev` and opens the interactive TUI. Edit `agent/instructions.md` and skills under `agent/skills/`; eve reloads on change.

Headless (no TUI):

```bash
npm exec -- eve dev --no-ui
```

## Layout

| Path | Role |
|---|---|
| `agent/instructions.md` | Always-on Euodia identity and standing rules |
| `agent/skills/clarify-direction/` | Direction workshop procedure + `references/out-of-scope.md` |
| `agent/sandbox/workspace/agora/` | Empty durable SoT seed (Euodia does not write masters) |
| `agent/agent.ts` | Model / runtime config |

## Notes

- Agora has no root npm workspace; this package is self-contained.
- Navigate-progress is intentionally not seeded here (v1 = direction / clarify only).
