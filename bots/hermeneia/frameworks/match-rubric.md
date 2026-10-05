# Match rubric — Hermeneia

Disclosed framework. Read when scoring. Do not invent a vibes percent.

Agora-adapted from the public offer-toolkit match rubric. English only. No third-party branding.

**Gate rule (Agora):** compute a single **match score** point. Gate against **M=70** / **N=80** using that point. Optional `match_range` (±5–8 points) is display-only — never gate on the range.

---

## 1. Formula

```
match_percent = 100 × (0.6 × MustHaveScore + 0.2 × NiceToHaveScore + 0.2 × HiddenSignalFit)
```

State the weights you used. If a must-have is a hard deal-breaker (required cert, clearance, citizenship), treat a miss as a **threshold fail**: force the point into **25–35%** (confident no).

---

## 2. Hit scores (each Must / Nice item)

| Hit | Score | When |
|---|---|---|
| Full | **1.0** | Direct evidence on masters; quantifiable or verifiable detail; experience mostly within ~3 years |
| Partial / adjacent | **0.5** | Adjacent domain; claim without detail; experience mostly 3–7 years old; contributed but JD wants led |
| Miss | **0.0** | No evidence on masters. Oral “I can do it” without resume evidence = **0** |

---

## 3. MustHaveScore

```
MustHaveScore = sum(hit for each must-have) / count(must-haves)
```

Example: hits 1.0 / 1.0 / 0.5 / 0.0 → MustHaveScore = 2.5 / 4 = 0.625

### Caps

| Condition | Cap on final match_percent |
|---|---|
| Any one must-have hit = 0 | ≤ **75%** |
| Two or more must-have hits = 0 | ≤ **55%** |
| Threshold must-have miss | **25–35%** (force) |

---

## 4. NiceToHaveScore

```
NiceToHaveScore = sum(hit for each nice-to-have) / count(nice-to-haves)
```

Weight already ×0.2 in the formula.

---

## 5. HiddenSignalFit

Pick the 3–5 strongest hidden signals from decode. Score each 0 / 0.5 / 1:

| Score | When |
|---|---|
| **1** | Masters / preferences clearly match the signal |
| **0.5** | Neutral / unclear |
| **0** | Clear mismatch or counter-signal |

```
HiddenSignalFit = sum / count
```

---

## 6. Output

Always emit:

1. **Gate point** `match_percent` (integer percent).
2. Optional **display range** `match_range` (e.g. 80–88) — not used for G3.
3. Breakdown: MustHaveScore, NiceToHaveScore, HiddenSignalFit, and the weighted parts.
4. Gap list with tiers (§7). Risks separate from gaps (§8).

### Qualitative band (display aid only — G3 still uses M/N on the point)

| Point | Band label (optional) |
|---|---|
| ≥ 85% | Strong fit |
| 70–84% | Good fit |
| 55–69% | Medium fit |
| 40–54% | Weak fit |
| &lt; 40% | Poor fit |

---

## 7. Gap tiers

Every miss or partial must/nice item gets a tier:

### Fixable (within ~30 days)

Adjacent experience needs framing; missing short-learn tool/cert; portfolio case can be split from existing work. Give a concrete fix (“pull Y from project X; add these three numbers”).

### Hard (not short-term)

Years in a domain, leadership tenure, scale/stage experience, degree/visa/structural constraints. Either story-bridge with adjacent proof or decline the JD.

### Skip (not material)

Boilerplate nice-to-haves, communication fluff, duplicates of must-haves. **Do not list these** in the final gap section — they distract.

---

## 8. Risks (not gaps)

**Gap** = what masters lack. **Risk** = what a hiring manager may worry about even when gaps are small.

Common risk dimensions: industry/company-size/role switch; hop frequency; level stretch; focus mismatch; salary expectation; visa/geo/timezone.

For each risk: HM objection + honest user response angle (no fabrication).

---

## 9. Masters required

Scoring needs Mneme masters present and usable: `profile.yaml`, `preferences.yaml`, `master-resume.md`.

If masters are missing or too thin to evidence hits → **decode only**. Leave `match_percent` unset / `unscored`. Never invent a percent.
