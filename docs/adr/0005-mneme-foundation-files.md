# ADR 0005 — Foundation files and Mneme sole-writer

## Status

Accepted

## Context

A single career-profile blob mixed identity, wants, and evidence. Job-specific resumes must not overwrite the master story.

## Decision

Under `/workspace/agora/`:

- `profile.yaml` — who is the candidate (Mneme writes)
- `preferences.yaml` — what they want (Mneme writes; Euodia may propose)
- `master-resume.md` — professional story/evidence with `variant: master` (Mneme writes; human+agent authored)
- `applications/resume_<company>_<role>.md` — job-specific presentation (Kairos writes)

Mneme does not render tailored resumes, score JDs, or search jobs. v1 intake: interview, resume/PDF import, LinkedIn PDF/paste. No per-claim source fields in v1.

## Consequences

Clear SoT for the fleet. Kairos never mutates master files. Preferences have one writer.
