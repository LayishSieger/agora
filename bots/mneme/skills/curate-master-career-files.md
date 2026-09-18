---
name: Curate master career files
description: >-
  Use when Mneme builds or updates /workspace/agora/profile.yaml,
  preferences.yaml, and master-resume.md. Interview, import resume/PDF, or
  LinkedIn PDF/paste. Completeness over concision. Never fabricate. Never write
  job-specific resumes (Kairos).
---

# Curate master career files

## Foundation files

| Path | Answers |
|---|---|
| `/workspace/agora/profile.yaml` | Who is the candidate? |
| `/workspace/agora/preferences.yaml` | What do they want? |
| `/workspace/agora/master-resume.md` | Professional story / evidence |

Shapes: `schemas/profile.yaml`, `schemas/preferences.yaml`, `schemas/master-resume.md`.

## Principles

1. **Never fabricate.** Guide and clarify; every number confirmed or `[to confirm]`.
2. **One question at a time** in interview mode.
3. **Completeness over concision.** No page limit. Do not trim for “resume-worthiness.”
4. **No bare skills.** Skills live inside tagged bullets in master-resume (see `guides/writing-tips.md`).
5. **Mneme sole-writes** these three files. Euodia may propose preference changes; persist only after user confirm.
6. **Do not** write `applications/resume_*` or CreateAgent. Message Agora `need <Name>` if needed.

## Routing

| Signal | Flow |
|---|---|
| Upload / paste resume | Import resume — below |
| LinkedIn URL or LinkedIn PDF/paste | `prompts/linkedin-import.md` |
| Build from scratch / chat | `prompts/interview.md` |
| Add a role/project/skill to existing files | Delta update — below |

Unclear? Ask once whether they have a resume/LinkedIn export or want to interview from scratch.

## Import resume / PDF

1. Read PDF or text.
2. Map identity → `profile.yaml`; wants/targets if present → `preferences.yaml`; story → `master-resume.md` (`variant: master`).
3. Diagnose weak bullets vs `guides/writing-tips.md`; report first; rewrite wording only with consent.
4. Keep everything — no length cuts.
5. Confirm metrics → write all three files.

## LinkedIn

Follow `prompts/linkedin-import.md`. Map About/notes into `preferences.yaml` (`career_notes` / targets), contact into `profile.yaml`, history into `master-resume.md`.

## Interview

Follow `prompts/interview.md`. Collect contact → preferences → full experience/projects/education → extras. Write three files when confirmed.

## Delta update

Patch only what changed; re-confirm new metrics; rewrite affected files.

## master-resume.md rules

- Frontmatter must include `variant: master` and `updated`.
- Story/evidence only — no contact block, no target_roles (those live in profile/preferences).
- Tagged bullets; optional `variants` for alternate phrasings.
- Echo full structure; list every number for confirmation.

## Done

Tell the user which paths were written. Do not start Kairos/Zetesis unless they ask — then tell them to use Agora / the right stage bot.
