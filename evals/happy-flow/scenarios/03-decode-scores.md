# 03 — Decode + M/N scores (Hermeneia)

**Bot:** Hermeneia (`skills/decode-job.md` + `frameworks/`).

**Thresholds:** M=70 · N=80.

## Read

Pointer from Zetesis. Masters (`profile.yaml`, `preferences.yaml`, `master-resume.md`). Job list / JD SoT (URL first; paste if fetch fails).

## Happy-flow score (use this for full pipeline)

**Score: 85%** (≥ N) → auto-forward to Kairos after G1.

Synthetic sample for seam checks — not a live rubric audit. Live JD quality is manual.

### Hermeneia does

1. Intake JD (URL→paste; ask reuse if jd-bank hit).
2. **Decode-first** all five layers (3–5 English evidence-labeled bullets each) **before** any match percent:
   - Requirements (HM translation)
   - Must-haves
   - Nice-to-haves
   - Hidden signals
   - Level / team / stage
3. Score with disclosed match rubric → **85%** gate point (optional display range OK; gate uses the point). Persist Must / Nice / Hidden breakdown + gap tiers.
4. Sole-write `/workspace/agora/jd-bank/helios-data-staff-platform.md` (frontmatter + layers + match/gaps/risks + go/no-go). Markdown only — no polished HTML report pack.
5. Auto-forward: DM Kairos with company, role, path to jd-bank entry.
6. DM Euodia: match band + jd-bank path.

### Expected jd-bank shape (assert)

Frontmatter at least: `company`, `role`, `source`, `match_percent: 85`, `verdict_band: forward` (or equivalent), `gaps`, `updated`.

Body sections present:

```
## Requirements
## Must-haves
## Nice-to-haves
## Hidden signals
## Level / team / stage
## Match
## Gaps and risks
## Go / no-go
```

### Expected DMs

```
from: Hermeneia
to: Kairos
type: pointer
payload:
  company: Helios Data
  role: Staff Platform Engineer
  path: /workspace/agora/jd-bank/helios-data-staff-platform.md
  match_percent: 85
  band: forward

from: Hermeneia
to: Euodia
type: pointer
payload:
  stage: decode
  company: Helios Data
  role: Staff Platform Engineer
  path: /workspace/agora/jd-bank/helios-data-staff-platform.md
  match_percent: 85
```

---

## Band forks (separate short runs)

### Below M — score 65%

1. Five layers still written.
2. Write jd-bank still (with match fields).
3. Confident no. Do not ask. Do not DM Kairos.
4. Stop (G7).

**PASS:** A1 + H5 — no forward.

### Middle — score 75%

1. Five layers + jd-bank.
2. Ask user. Forward only if user says yes.
3. If user says no → stop; no Kairos DM.

**PASS:** A2 + H5 — ask then conditional forward.

### Masters thin/absent — unscored decode

1. Decode five layers.
2. Write jd-bank **without** inventing `match_percent` (mark unscored / masters missing).
3. Do not forward to Kairos on vibes.

**PASS:** H4 — no fabricated percent.

---

## Pass hooks (happy path)

- jd-bank sole-written by Hermeneia with five layers + match breakdown (H1–H3).
- Decode before score (H2).
- 85% point → Kairos pointer DM (A3 / H5).
- No full JD in DM.
- M/N values are 70/80.
- No polished HTML report pack (H6).
