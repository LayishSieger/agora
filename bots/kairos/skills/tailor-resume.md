---
name: Tailor resume
description: >-
  Use when Kairos writes applications/resume_<company>_<role>.md and a
  simple HTML loader from masters + jd-bank. Never auto-forward to Melete
  (G4). Never fabricate, apply, CreateAgent, search, decode, coach, or
  negotiate.
---

# Tailor resume

## One job

Write a job-specific resume for one company/role. Sole-write:

- `/workspace/agora/applications/resume_<company>_<role>.md`
- `/workspace/agora/applications/resume_<company>_<role>.html` (one simple template that loads the md)

Done when both are written and the user knows the paths. **Hard stop** — do not auto-forward to Melete (G4).

## Hard rules

- Never fabricate employers, titles, dates, metrics, or skills.
- Never apply or submit.
- Never CreateAgent.
- Never tell the user to type `need`.
- DMs are pointers only (G8).
- **No auto Kairos → Melete (G4).** User applies and commits; then user or navigator opens Melete.
- Do not mutate Mneme masters or story-bank.
- Default on gate fail: **stop only** (G7).

## Read first

1. Pointer: company, role, path to jd-bank entry.
2. Read that jd-bank entry.
3. Read Mneme masters: `profile.yaml`, `preferences.yaml`, `master-resume.md`.
4. Honor preferences hints (`emphasize`, `de_emphasize`, `resume_voice`) without inventing facts.

## Steps

1. **Confirm inputs** — Company, role, jd-bank path present. If JD missing, stop and ask for pointer (G7 stop only).
2. **Select evidence** — Choose true bullets from master-resume that support the JD. Mark gaps honestly; do not invent.
3. **Write markdown** — Sole-write `applications/resume_<company>_<role>.md`. Job-specific presentation only. English only. No third-party footers.
4. **Write HTML shell** — Sole-write matching `.html` that loads/displays the markdown (one simple shared pattern). Do not regenerate a full designed pack.
5. **Tell the user** — Paths written. Remind: fleet never applies; they apply and commit. Melete comes after apply-commit via them or Euodia — not auto from you.
6. **DM navigator** — Pointer: company, role, path to `applications/resume_*`. Stage: tailor complete / awaiting apply.
7. **Melete (only on engage)** — If user or navigator asks you to seat Melete **after** apply-commit: DM Melete with company, role, path to `applications/resume_*`. If Melete missing: Agora `need Melete`; continue when confirmed (G9). **Never auto-send this on tailor complete.**

### Completion criteria

- [ ] `resume_<company>_<role>.md` written under applications.
- [ ] Matching `.html` loader written.
- [ ] No fabricated facts.
- [ ] No auto-forward to Melete.
- [ ] Navigator DM sent (pointer).
- [ ] No apply / CreateAgent / user-typed `need`.

## HTML shell (minimal)

One simple pattern, e.g. a short HTML file that references or embeds a readable view of the sibling `.md`. No twelve templates. No bilingual packs. No third-party brand footers.

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

Applications files written. User knows apply is theirs. Stop.
