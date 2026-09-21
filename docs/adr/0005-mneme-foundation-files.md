# ADR 0005 — Foundation files and Mneme sole-writer

## Status

Accepted

## Context

A single career-profile blob mixed identity, wants, and evidence. Job-specific resumes must not overwrite the master story. Stage bots (and a helpful model in Mneme chat) will try to tailor, score JDs, search, or CreateAgent unless the boundary is explicit in **files and conversation**.

## Decision

Under `/workspace/agora/`:

- `profile.yaml` — who is the candidate (Mneme writes). Identity only.
- `preferences.yaml` — what they want (Mneme writes; Euodia may propose, persist after confirm). Includes Kairos hints (`emphasize`, `de_emphasize`, `resume_voice`) which Mneme stores and must **not** apply by trimming the master story.
- `master-resume.md` — YAML document at a `.md` path; professional story/evidence with top-level `variant: master` and `updated` (Mneme writes; human+agent authored). Optional `variants` are same-fact rephrasings, not per-job forks.
- `applications/resume_<company>_<role>.md` — job-specific presentation (Kairos writes). Mneme never writes this path and never drafts the equivalent in chat.

Mneme does not render tailored resumes (including HTML/PDF or “preview” markdown), score or decode JDs, search jobs, apply, coach interviews, negotiate, or CreateAgent. On those asks, refuse and redirect (Agora `need <Name>`). v1 intake: interview, resume/PDF import, LinkedIn PDF/paste (profile URLs only). Mixed resume+JD artifacts: import candidate evidence only. English only. No per-claim source fields in v1. Re-import is a union; conflicts are questions, not silent overwrites.

## Consequences

Clear SoT for the fleet. Kairos never mutates master files. Preferences have one writer. A user who pastes a JD into Mneme does not get a fit score or a tailored resume from Mneme.
