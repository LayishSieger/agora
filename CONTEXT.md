# CONTEXT.md

## Glossary

**Agora (Ἀγορά)** — Career-fleet creator and steward. Creates, configures, repairs, and upgrades career-fleet bots and skills. Only bot allowed to CreateAgent. After install: greets once, points to Euodia or Mneme, then stays quiet unless asked or messaged `need <Name>`. Public template is thin: Agora persona + create/steward skills only.

**Euodia (Εὐοδία)** — Career Pathfinder. Explores career directions and growth opportunities. Optional to *use* when direction is unclear. Does not gate Mneme. Must not CreateAgent; messages Agora if a later bot is needed.

**Mneme (Μνήμη)** — Career Curator. Interviews, collects experiences, maintains the master career profile (source of truth). Always present after first-run. Must not CreateAgent; messages Agora if a later bot is needed.

**Zetesis (Ζήτησις)** — Job Finder. Searches opportunities from profile and preferences. Lazy-created by Agora on demand.

**Hermeneia (Ἑρμηνεία)** — Job Decoder. Analyzes job descriptions; explains requirements, priorities, fit. Lazy-created by Agora on demand.

**Kairos (Καιρός)** — Resume Tailor. Adapts master profile into a job-specific resume. Lazy-created by Agora on demand.

**Melete (Μελέτη)** — Interview Coach. Interview prep, practice, feedback. Lazy-created by Agora on demand.

**Peitho (Πειθώ)** — Offer Negotiator. Offer understanding and negotiation support. Lazy-created by Agora on demand.

**Career pipeline** — Euodia → Mneme → Zetesis → Hermeneia → Kairos → Melete → Peitho.

**Career foundation** — Euodia and Mneme (both created on first-run).

**Career execution** — Zetesis → Hermeneia → Kairos → Melete → Peitho (lazy).

**need protocol** — A stage bot that requires another fleet bot sends Agora `need <Name>`. Agora creates it if missing and replies with the id. Stage bots never CreateAgent.

**agora repo** — Public GitHub source of truth: `layishsieger/agora`. Holds bot blueprints (`bots/<name>/profile.md`, skills), docs, and the Vercel install-telemetry route. All system authorship lives here.

**blueprint** — Versioned files in the agora repo that Agora fetches to CreateAgent a child and install its skills.

**install event** — Anonymous telemetry fired by Agora after a successful CreateAgent (`event=install`, bot name, tag, `agora=1`). Not a raw GitHub zip download count. Honors `DO_NOT_TRACK`.

**profile.yaml** — Who is the candidate? Mneme sole-writes. Path: `/workspace/agora/profile.yaml`.

**preferences.yaml** — What does the candidate want? Mneme sole-writes (Euodia may propose; Mneme persists after confirm). Path: `/workspace/agora/preferences.yaml`.

**master-resume.md** — Professional story / evidence. Human+agent authored source of truth. Frontmatter includes `variant: master`. Mneme sole-writes. Path: `/workspace/agora/master-resume.md`.

**resume_<company>_<role>.md** — Job-specific presentation of the story. Kairos sole-writes. Path: `/workspace/agora/applications/resume_<company>_<role>.md`.

