# Fleet identity map

Locked 26 Sep 2026. Agora-owned. Children do not brand themselves.

Canonical copy for disk after Agora self-materialize. The **Apply fleet identity** skill also embeds these tables so the Add snapshot can run before playbooks land.

## Title chips

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

## Geometric fallbacks

Used when `bots/<slug>/avatar.png` is missing on disk. Do not generate an image.

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

## Avatar files (later assets PR)

Convention: **`bots/<slug>/avatar.png`** in this repo → **`/workspace/bots/<slug>/avatar.png`** after that slug’s blueprint fetch (Agora: `bots/agora/avatar.png`).

v1: no binaries in tree. If the file is absent, still set the title; apply the geometric row. Do not call live image generation.
