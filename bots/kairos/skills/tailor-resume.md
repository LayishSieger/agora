---
name: Tailor resume
description: >-
  Use when Kairos writes applications/resume_<company>_<role>.md, a thin
  HTML loader from the shared template, and sibling .diff.md from masters
  + jd-bank. Never auto-forward to Melete (G4). Never fabricate, apply,
  CreateAgent, search, decode, coach, or negotiate.
---

# Tailor resume

## One job

Write one job-specific resume for one company/role. Sole-write:

- `/workspace/agora/applications/resume_<company>_<role>.md`
- `/workspace/agora/applications/resume_<company>_<role>.html` (thin loader from shared template)
- `/workspace/agora/applications/resume_<company>_<role>.diff.md` (sibling tailor diff)

Done when all three are written and the user knows the paths. **Hard stop** — do not auto-forward to Melete (G4).

## Hard rules

- Never fabricate employers, titles, dates, metrics, or skills.
- Never inflate verbs beyond master evidence.
- Never apply or submit.
- Never CreateAgent.
- Never tell the user to type `need`.
- DMs are pointers only (G8).
- **No auto Kairos → Melete (G4).** User applies and commits; then user or navigator opens Melete.
- Do not mutate Mneme masters or story-bank.
- Default on gate fail: **stop only** (G7).
- **One** tailored resume — not a three-version pack.
- Tools are **outcome-only** (read jd-bank + masters; write applications). No connector/MCP/tool-id catalog.

## Disclosed frameworks (read when needed)

| File | When |
|---|---|
| [`frameworks/tailor-rules.md`](../frameworks/tailor-rules.md) | Selecting evidence; rewriting bullets; preference hints |
| [`frameworks/diff-schema.md`](../frameworks/diff-schema.md) | Sibling changelog shape |
| [`templates/resume-loader.html`](../templates/resume-loader.html) | Shared HTML pattern to copy into applications |

## Read first

1. Pointer: company, role, path to jd-bank entry.
2. Read that jd-bank entry (decode + match; use must/nice/hidden for alignment).
3. Read Mneme masters: `profile.yaml`, `preferences.yaml`, `master-resume.md`.
4. Honor preferences hints (`emphasize`, `de_emphasize`, `resume_voice`) without inventing facts.

## Steps

1. **Confirm inputs** — Company, role, jd-bank path present. Masters readable. If JD missing, stop and ask for pointer (G7 stop only).
2. **Strategy** — Using tailor-rules: name 3 Must-have keywords (true on masters), 1 core narrative, reorder/compress plan.
3. **Select evidence** — Choose true bullets from master-resume that support the JD. Mark gaps honestly; do not invent.
4. **Write markdown** — Sole-write `applications/resume_<company>_<role>.md`. Job-specific presentation only. English only. No third-party footers.
5. **Write HTML loader** — Copy [`templates/resume-loader.html`](../templates/resume-loader.html) to matching `.html`. Set `RESUME_MD` to the sibling `.md` filename. Set `<title>`. Do not regenerate a twelve-template pack.
6. **Write tailor diff** — Sole-write sibling `.diff.md` per diff-schema (strategy + change blocks + compressed/omitted + honest gaps). Not inside the resume body.
7. **Tell the user** — Paths written (md, html, diff). Remind: fleet never applies; they apply and commit. Melete comes after apply-commit via them or Euodia — not auto from you.
8. **DM navigator** — Pointer: company, role, path to `applications/resume_*.md`. Stage: tailor complete / `awaiting_apply`.
9. **Melete (only on engage)** — If user or navigator asks you to seat Melete **after** apply-commit: DM Melete with company, role, path to `applications/resume_*`. If Melete missing: Agora `need Melete`; continue when confirmed (G9). **Never auto-send this on tailor complete.**

### Completion criteria

- [ ] `resume_<company>_<role>.md` written under applications.
- [ ] Matching `.html` loader written from shared template (loads sibling md).
- [ ] Sibling `.diff.md` changelog written (not embedded in resume).
- [ ] No fabricated facts; no verb inflation.
- [ ] Masters / story-bank untouched.
- [ ] No auto-forward to Melete (G4).
- [ ] Navigator DM sent (pointer, `awaiting_apply`).
- [ ] No apply / CreateAgent / user-typed `need`.

## Anti-jobs

| Refuse | Who |
|---|---|
| Search openings | Zetesis |
| Decode / score JD | Hermeneia |
| Interview prep | Melete |
| Negotiate / compare | Peitho |
| Write masters / story-bank | Mneme |
| Write journey.md | Euodia |
| Apply / CreateAgent | Never / Agora |

## Done

Applications md + html + diff written. User knows apply is theirs. Stop.
