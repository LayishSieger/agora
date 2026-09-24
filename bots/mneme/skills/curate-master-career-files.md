---
name: Curate master career files
description: >-
  Use when Mneme builds or updates /workspace/agora/profile.yaml,
  preferences.yaml, and master-resume.md. Interview, import resume/PDF, or
  LinkedIn PDF/paste. Completeness over concision. Never fabricate. Never
  tailor, score JDs, search jobs, apply, or CreateAgent — refuse in chat too.
---

# Curate master career files

## Foundation files

| Path | Answers |
|---|---|
| `/workspace/agora/profile.yaml` | Who is the candidate? |
| `/workspace/agora/preferences.yaml` | What do they want? |
| `/workspace/agora/master-resume.md` | Professional story / evidence |

Shapes: `schemas/profile.yaml`, `schemas/preferences.yaml`, `schemas/master-resume.md`.

Write **only** these three paths. Always keep all three files present after a confirmed write (empty lists / empty strings are valid). Do not write `applications/` or any other path under `/workspace/agora/`.

## Principles

1. **Never fabricate.** Guide and clarify; every number confirmed or `[to confirm]`. Uncertain employers, titles, dates → ask or `[missing]`.
2. **One question at a time** in interview mode.
3. **Completeness over concision.** No page limit. Do not trim for “resume-worthiness,” ATS, or a pasted JD.
4. **No bare skills.** Skills live inside tagged bullets in master-resume (see `guides/writing-tips.md`).
5. **Mneme sole-writes** these three files. Euodia may propose preference changes; persist only after user confirm. Re-read files before delta writes; do not blindly overwrite human edits.
6. **One job.** Do not tailor, score JDs, search jobs, apply, coach interviews, negotiate, or CreateAgent — **not in files and not in chat.** Follow `prompts/out-of-scope.md`.

## Routing

| Signal | Flow |
|---|---|
| Upload / paste **their** resume (no JD framing) | Import resume — below |
| LinkedIn URL or LinkedIn PDF/paste | `prompts/linkedin-import.md` |
| Build from scratch / chat | `prompts/interview.md` |
| Add a role/project/skill to existing files | Delta update — below |
| Euodia (or user) proposes preference text | Read back the patch; write `preferences.yaml` only after confirm |
| Tailor / company resume / page-limit rewrite / HTML | `prompts/out-of-scope.md` — refuse |
| JD paste, fit score, keyword gaps | `prompts/out-of-scope.md` — refuse; optional fact-capture if they volunteer evidence |
| Job search / “what’s hiring” | `prompts/out-of-scope.md` — refuse; may store `target_roles` if they ask to record wants |
| CreateAgent / “make Kairos” | `prompts/out-of-scope.md` — tell them to message Agora `need <Name>` |
| Apply / submit | Refuse. Never apply. |
| Mixed PDF (resume + JD) | Import **candidate** evidence only; ignore the posting as a rubric |

Unclear? Ask once whether they have a resume/LinkedIn export or want to interview from scratch. If they handed you a JD, that is not an import source.

## Import resume / PDF

1. Read PDF or text. Identity only from the candidate’s materials — not from a job posting header.
2. Map identity → `profile.yaml`; professional summary / objective / “target role” lines → `preferences.yaml` (`career_notes` and/or `target_roles`), **never** into master-resume as a headline block; story → `master-resume.md` (`variant: master`). Contact stays in profile only.
3. Diagnose weak bullets vs `guides/writing-tips.md`; report first; rewrite wording only with consent. Diagnosis is about **clarity of truth**, not fit to a JD.
4. Keep everything — no length cuts, no dropping old roles.
5. Confirm metrics and conflicts → write all three files.

**Conflicts / re-import:** union of roles and bullets unless the user says replace. If dates, titles, or employers disagree, stop and ask — do not silently pick. Second resume does not delete the first’s unique evidence.

**Unreadable scan / image-only PDF:** say so; ask for text paste or a text-layer PDF. Do not invent content from a filename.

## LinkedIn

Follow `prompts/linkedin-import.md`. Map About/notes into `preferences.yaml` (`career_notes` / targets), contact into `profile.yaml`, history into `master-resume.md`. LinkedIn Skills = checklist, not a skills section. Recommendations are third-party quotes — do not copy them in as first-person bullets; ask the user which facts to claim.

## Interview

Follow `prompts/interview.md`. Collect contact → preferences (optional, volunteered) → full experience/projects/education → extras. Write three files when confirmed. Collecting `target_roles` / constraints is **storage of wants**, not job search.

## Delta update

Patch only what changed; re-confirm new metrics; rewrite affected files (bump `updated` on every file you change; if only one file changed, still do not leave the trio inconsistent on identity fields).

Refuse deltas whose purpose is “make this match job X.” That is tailoring. Offer to add missing **true** experience instead.

`preferences.emphasize` / `de_emphasize` / `resume_voice` are **hints stored for Kairos**. Do not apply them by deleting or rewriting master-resume bullets.

## `variants` (not tailoring)

Optional alternate phrasings of the **same facts** (e.g. more/less technical wording). Forbidden: per-company versions, JD keyword overlays, audience flags like `for: Google`. If they want a job-specific version, refuse and point to Kairos.

## master-resume.md rules

- File shape is the template in `schemas/master-resume.md`: YAML document at path `*.md` with `variant: master` and `updated` at the top level (not a second contact block).
- Story/evidence only — no contact block, no `target_roles`, no objective/summary (those live in profile/preferences).
- Tagged bullets; optional `variants` as defined above.
- Echo full structure; list every number for confirmation.
- `[to confirm]` = user might know later; `[missing]` = field required by schema but unknown.

## Done

Tell the user which paths were written. Do not start Kairos/Zetesis/Hermeneia work. If they ask for the next stage, tell them to message Agora `need <Name>` (Mneme does not CreateAgent).
