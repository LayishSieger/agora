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
| B8 | `applications/resume_*` | Kairos | Only Kairos wrote md + html + sibling `.diff.md` |
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

## H. Hermeneia depth (decode-first + rubric + jd-bank)

**Hard FAIL** when any required H item fails on a decode scenario run (with masters present unless the fork is masters-absent).

| ID | Item | PASS if | **FAIL** if |
|---|---|---|---|
| H1 | Five layers | jd-bank entry has all five decode sections before any match percent: requirements (HM translation), must-haves, nice-to-haves, hidden signals, level/team/stage — each 3–5 English bullets with evidence labels | Any of the five layers missing, empty, or written after inventing a score |
| H2 | Decode-first order | Sim / entry shows decode layers completed before `match_percent` is emitted | Score appears with missing layers |
| H3 | Rubric fields | When masters present: frontmatter has `match_percent` (gate point) and match breakdown (Must / Nice / Hidden weighted parts); gaps use tier labels (fixable / hard / skip) | Match fields absent when masters present; vibes-only percent with no breakdown |
| H4 | Masters required | Thin or missing masters → decode written, **no** fabricated `match_percent` | Score emitted when masters absent/thin |
| H5 | M/N bands held | Same as A1–A3; gate uses the single point vs M=70 / N=80 | Band action wrong; range used as the gate instead of the point |
| H6 | jd-bank schema | Markdown only; frontmatter includes company, role, source, match_percent (or explicit unscored), verdict band, gaps, updated; body has layers + match/gaps/risks + go/no-go; no polished HTML report pack | Required sections missing; polished multi-section HTML report authored |

---

## I. Kairos depth (tailor rules + HTML loader + sibling diff)

**Hard FAIL** when any required I item fails on a tailor scenario run.

| ID | Item | PASS if | **FAIL** if |
|---|---|---|---|
| I1 | Tailored md | `applications/resume_<company>_<role>.md` exists; bullets trace to masters; no fabricate / verb inflation | Resume missing; invented employers/metrics/skills; verb inflation vs masters |
| I2 | HTML loader | Matching `.html` is a thin loader from the shared Kairos template pattern and loads/displays the sibling md (English; no third-party brand footers) | HTML missing; full twelve-template pack; brand footer; does not reference sibling md |
| I3 | Sibling diff | `applications/resume_<company>_<role>.diff.md` exists beside the resume with strategy + change blocks (not embedded in resume body) | `.diff.md` missing; changelog only inside resume body |
| I4 | Masters untouched | `profile.yaml`, `preferences.yaml`, `master-resume.md`, `story-bank.md` unchanged by Kairos | Any master / story-bank mutation by Kairos |
| I5 | G4 hard stop | Same as D1–D3: no auto Kairos→Melete; Euodia pointer with `awaiting_apply`; fleet never applies | Melete DM on tailor complete; missing navigator pointer; fleet apply |

---

## J. Zetesis depth (public hunt + batch of three + evidence labels)

**Hard FAIL** when any required J item fails on a hunt / continue scenario run.

| ID | Item | PASS if | **FAIL** if |
|---|---|---|---|
| J1 | Batch of three | Presented batch is **~3** matching/directional jobs; user asked to pick for Hermeneia **or** continue | Presented list is not ~3 (e.g. full dump of 30 with no batch UX); no pick-or-continue ask |
| J2 | Evidence labels | Each listed row carries a disclosed evidence label (`seen` / `verified` or `inferred` / `directional`) | Rows missing evidence labels; unlabeled “verified” claims |
| J3 | No match % | Hunt list / presentation has **no** Hermeneia-style match percent, fit %, or score column | `match_percent` / match % / fit % shown on hunt list |
| J4 | Append continue | After user says continue, durable `jobs/` markdown **appends** ~3 more; prior batch rows remain | Continue replaces the file; prior rows deleted; new batch not appended |
| J5 | Markdown only | Durable artifact is markdown under `/workspace/agora/jobs/`; **no** hunt HTML report authored | Hunt HTML file / polished HTML jobs pack written |
| J6 | Walls / never fabricate | On auth / CAPTCHA / anti-bot wall, hunt **stops** without inventing openings (sim may use labeled fixtures when fetch is allowed) | Fabricated openings after a wall; unlabeled invented postings |

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
| H Hermeneia depth | | | |
| I Kairos depth | | | |
| J Zetesis depth | | | |
| **Total** | | | |

**Verdict:** PASS only if zero FAIL on A–F and **H**/**I**/**J** required items for the scenario run. G items required for full happy-flow. H, I, and J are hard FAIL when depth invariants are missing.
