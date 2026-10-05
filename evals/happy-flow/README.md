# Happy-flow seam evals

Seam checks for the gated fleet pipeline. Not depth/quality evals for decode or tailor craft — seam checks only.

**Pipeline:** Euodia (direction) → Mneme (masters) → Zetesis → Hermeneia (M/N) → Kairos → **hard stop (G4)** → Euodia navigate → Melete / Peitho.

## What this folder is

| Path | Purpose |
|---|---|
| `checklist.md` | Pass/fail items for a sim dump |
| `fixtures/agora/` | Seed `/workspace/agora/` career files |
| `scenarios/` | Short stage scripts (what each bot should write / DM) |
| `check-sole-writers.sh` | After a sim dump: who wrote which paths |

## How to run (manual Cursor sim)

1. Copy fixtures into a temp tree:

```bash
SIM=/tmp/agora-happy-flow/workspace/agora
rm -rf /tmp/agora-happy-flow
mkdir -p "$SIM"
cp -R fixtures/agora/. "$SIM/"
```

2. Open the PR branch checkout that has the bot skills (`bots/*/skills/`).
3. Walk `scenarios/` in order. For each stage:
   - Read the bot’s skill from the checkout.
   - Write only that bot’s sole-write paths under `$SIM`.
   - Append pointer DMs to a `dm-log.md` (pointers only — no full JD/offer body).
4. Score the dump against `checklist.md`.
5. Optionally run the sole-writer checker:

```bash
./check-sole-writers.sh /tmp/agora-happy-flow/workspace/agora /tmp/agora-happy-flow/dm-log.md
```

## Thresholds (settled)

| Symbol | Value | Meaning |
|---|---|---|
| **M** | 70% | Hard floor — below = confident no, no forward |
| **N** | 80% | Forward threshold — at/above = auto-forward to Kairos |
| Middle | 70 ≤ score &lt; 80 | Ask user; forward only on yes |

## Out of scope here

- Live JD fetch quality / subjective rubric correctness (manual acceptance)
- STAR curriculum quality
- Real Grok API / CreateAgent / Release publish
- Apply / submit simulation as fleet action (user applies; fleet never does)

Structural Hermeneia depth (five layers, masters-required scoring, jd-bank schema, M/N bands) is checklist section **H**. Structural Kairos depth (tailored md, HTML loader, sibling `.diff.md`, masters untouched, G4) is checklist section **I**. Structural Zetesis depth (**batch of three**, evidence labels, no match % on hunt list, append-on-continue, markdown-only jobs list, walls stop without fabricate) is checklist section **J** — hard FAIL when those invariants are missing. Live board hunt / tailor / decode craft quality remains manual.

## Related

- Fleet stubs PR: branch `cursor/fleet-execution-stubs-1b4e`
- Skills under `bots/euodia|mneme|zetesis|hermeneia|kairos|melete|peitho/`
