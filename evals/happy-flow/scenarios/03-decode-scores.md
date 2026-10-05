# 03 — Decode + M/N scores (Hermeneia)

**Bot:** Hermeneia (`skills/decode-job.md`).

**Thresholds:** M=70 · N=80.

## Read

Pointer from Zetesis. Masters. Job list / JD SoT.

## Happy-flow score (use this for full pipeline)

**Score: 85%** (≥ N) → auto-forward to Kairos after G1.

### Hermeneia does

1. Decode short requirements.
2. Score 85% with short rationale (stub — no deep rubric).
3. Sole-write `/workspace/agora/jd-bank/helios-data-staff-platform.md`.
4. Auto-forward: DM Kairos with company, role, path to jd-bank entry.
5. DM Euodia: match band + jd-bank path.

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

1. Write jd-bank still.
2. Confident no. Do not ask. Do not DM Kairos.
3. Stop (G7).

**PASS:** A1 — no forward.

### Middle — score 75%

1. Write jd-bank.
2. Ask user. Forward only if user says yes.
3. If user says no → stop; no Kairos DM.

**PASS:** A2 — ask then conditional forward.

---

## Pass hooks (happy path)

- jd-bank sole-written by Hermeneia.
- 85% → Kairos pointer DM.
- No full JD in DM.
- M/N values are 70/80.
