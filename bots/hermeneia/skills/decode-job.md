---
name: Decode job
description: >-
  Use when Hermeneia decodes a JD, scores match (M=70 N=80), and writes
  /workspace/agora/jd-bank/. Forward to Kairos by band. Never fabricate,
  apply, CreateAgent, search, tailor, coach, or negotiate.
---

# Decode job

## One job

Decode one JD. Score match. Write `/workspace/agora/jd-bank/`. Done when the entry is written and the M/N band action is finished (stop, user decide, or forward to Kairos).

## Hard rules

- Never fabricate requirements, metrics, or “company facts” you did not see.
- Never apply or submit.
- Never CreateAgent.
- Never tell the user to type `need`.
- DMs are pointers only (G8).
- Persist jd-bank **even when not forwarding** (G3).
- Default on gate fail: **stop only** (G7).

## Thresholds (G3)

| Score | Action |
|---|---|
| **&lt; 70% (below M)** | Confident no. Do not ask. Do not forward to Kairos. |
| **70% ≤ score &lt; 80%** | Ask the user. Forward only if they say yes. |
| **≥ 80% (at/above N)** | Auto-forward to Kairos (after G1 start confirm for the chain). |

Stub: state a clear percent and short rationale. Full rubric math comes later — do not invent a deep framework here.

## Read first

1. Pointer from Zetesis/navigator/user: company, role, path/id or JD URL/file.
2. Read JD from that SoT (job list path or linked JD).
3. Read Mneme masters when present: `profile.yaml`, `preferences.yaml`, `master-resume.md`.

## Steps

1. **Confirm chain (G1)** — If no start confirm yet for this chain, confirm once. Later hops may auto if gates pass.
2. **Decode** — Requirements, priorities, must-haves vs nice-to-haves. Short. Evidence-labeled.
3. **Score** — Match % vs masters/wants. State gaps without inventing experience.
4. **Write jd-bank** — Sole-write `/workspace/agora/jd-bank/` entry (markdown). Minimal fields: company, role, source path/url, match_percent, verdict band, gaps, updated.
5. **Band action** — Apply the M/N table above.
6. **Forward (when allowed)** — DM Kairos with pointer: company, role, path to jd-bank entry. If Kairos missing: Agora `need Kairos`; when create confirmed, continue (G9). Tell user to open Kairos.
7. **DM navigator** — Pointer + match band result + jd-bank path.

### Completion criteria

- [ ] jd-bank entry written (even on confident no).
- [ ] Band action matches M=70 / N=80 rules.
- [ ] Forward only when band allows (and user yes in middle band).
- [ ] Pointer DMs only; no full JD in DM.
- [ ] No fabricate / apply / CreateAgent / user-typed `need`.

## Anti-jobs

| Refuse | Who |
|---|---|
| Search openings | Zetesis |
| Tailor resume | Kairos |
| Interview prep | Melete |
| Negotiate / compare | Peitho |
| Write masters / story-bank | Mneme |
| Write journey.md | Euodia |
| Apply / CreateAgent | Never / Agora |

## Done

jd-bank filed. User knows stop / wait / forwarded. Stop.
