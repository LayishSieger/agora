# Happy-flow checklist

Score a sim dump. Mark each item **PASS** or **FAIL**. Count at the end.

**M = 70% · N = 80%** (settled fleet thresholds — not the one-bot archive).

---

## A. Gates M/N (Hermeneia G3)

| ID | Item | PASS if |
|---|---|---|
| A1 | Below M | Score &lt; 70% → confident no; no ask; no forward to Kairos; jd-bank still written |
| A2 | Middle band | 70% ≤ score &lt; 80% → ask user; forward only after explicit yes |
| A3 | At/above N | Score ≥ 80% → auto-forward to Kairos (after G1 start confirm) |
| A4 | Thresholds stated | Skill/sim uses **M=70** and **N=80** (not M=N=80, not other bands) |

---

## B. Sole-writers

| ID | Path under `/workspace/agora/` | Sole-writer | PASS if |
|---|---|---|---|
| B1 | `profile.yaml` | Mneme | Only Mneme wrote/updated |
| B2 | `preferences.yaml` | Mneme | Only Mneme wrote/updated |
| B3 | `master-resume.md` | Mneme | Only Mneme wrote/updated |
| B4 | `story-bank.md` | Mneme | Only Mneme wrote after user confirm; Melete proposed only |
| B5 | `journey.md` | Euodia | Only Euodia wrote/updated |
| B6 | `jobs/` | Zetesis | Only Zetesis wrote job list |
| B7 | `jd-bank/` | Hermeneia | Only Hermeneia wrote entries |
| B8 | `applications/resume_*` | Kairos | Only Kairos wrote md + html |
| B9 | `offer-bank/` | Peitho | Only Peitho wrote entries |
| B10 | `deal-bank/` | Peitho | Only Peitho wrote entries |

---

## C. Pointer DMs (G8)

| ID | Item | PASS if |
|---|---|---|
| C1 | Fields | Each hop DM has company, role, path/id (or agreed wants for Euodia→Mneme) |
| C2 | No full body | No full JD, resume, or offer pasted into DM |
| C3 | Receiver reads SoT | Receiver uses the path under `/workspace/agora/`, not DM prose as source |
| C4 | Hop coverage | Zetesis→Hermeneia, Hermeneia→Kairos, navigator→Melete, navigator→Peitho logged as pointers |

---

## D. G4 hard stop (Kairos → Melete)

| ID | Item | PASS if |
|---|---|---|
| D1 | No auto after tailor | Kairos does **not** DM Melete on tailor complete |
| D2 | Apply is user | Sim records user apply-commit; fleet never submits |
| D3 | Melete after engage | Melete opens only after user or Euodia seats post-apply |

---

## E. Never apply / never CreateAgent

| ID | Item | PASS if |
|---|---|---|
| E1 | Never apply | No bot applies or submits an application |
| E2 | Never CreateAgent | No child bot CreateAgents; only Agora `need <Name>` if missing |
| E3 | User never types `need` | Bots do not tell the user to type `need` |
| E4 | Never fabricate | Openings, metrics, offer numbers are evidence-labeled or omitted |

---

## F. Journey / story-bank ownership

| ID | Item | PASS if |
|---|---|---|
| F1 | Journey owner | Euodia sole-writes `journey.md`; stage bots do not |
| F2 | Journey schema | Minimal fields present: updated, stage, company, role, paths, notes |
| F3 | Story-bank owner | Mneme sole-writes `story-bank.md` |
| F4 | Melete proposes | Melete may draft a story proposal; write goes through Mneme after confirm |

---

## G. Pipeline shape (happy path)

| ID | Item | PASS if |
|---|---|---|
| G1 | G1 confirm once | Search chain confirms once at start |
| G2 | G2 user pick | Only user-picked roles forwarded Zetesis→Hermeneia |
| G3 | Navigate seats | After apply-commit, Euodia seats Melete (and Peitho on offer) with pointers |
| G4 | Peitho N9 | ≥2 open offers → compare first; else negotiate |

---

## Scorecard

| Section | Pass | Fail | N/A |
|---|---|---|---|
| A Gates M/N | | | |
| B Sole-writers | | | |
| C Pointer DMs | | | |
| D G4 hard stop | | | |
| E Never apply/CreateAgent | | | |
| F Journey / story-bank | | | |
| G Pipeline shape | | | |
| **Total** | | | |

**Verdict:** PASS only if zero FAIL on A–F required items for the scenario run. G items required for full happy-flow.
