# CONTEXT.md

## Glossary

**Agora (Ἀγορά)** — Career-fleet creator and steward. Creates, configures, repairs, and upgrades career-fleet bots and skills. Only bot allowed to CreateAgent. After install: first-run greets once, points to Euodia or Mneme, then stays quiet unless asked or messaged `need <Name>`. The only public Grok Bot template in v1 (installer). Children are not published as their own templates. Does not do stage-bot jobs in Agora chat.

**Euodia (Εὐοδία)** — Career Pathfinder. Explores career directions and growth opportunities. Optional to *use* when direction is unclear. Does not gate Mneme. Must not CreateAgent; messages Agora if a later bot is needed.

**Mneme (Μνήμη)** — Career Curator. Interviews, collects experiences, maintains the master career profile (source of truth). Always present after first-run. Must not CreateAgent, tailor resumes, score JDs, search jobs, or apply; messages Agora `need <Name>` if a later bot is needed. Refuses those jobs in chat as well as in files.

**Zetesis (Ζήτησις)** — Job Finder. Searches opportunities from profile and preferences. Lazy-created by Agora on demand.

**Hermeneia (Ἑρμηνεία)** — Job Decoder. Analyzes job descriptions; explains requirements, priorities, fit. Lazy-created by Agora on demand.

**Kairos (Καιρός)** — Resume Tailor. Adapts master profile into a job-specific resume. Lazy-created by Agora on demand.

**Melete (Μελέτη)** — Interview Coach. Interview prep, practice, feedback. Lazy-created by Agora on demand.

**Peitho (Πειθώ)** — Offer Negotiator. Offer understanding and negotiation support. Lazy-created by Agora on demand.

**Career pipeline** — Euodia → Mneme → Zetesis → Hermeneia → Kairos → Melete → Peitho.

**Career foundation** — Euodia and Mneme (both created on first-run). Euodia’s CreateAgent may fail (no `profile.md` in the Release); Mneme must still be created. Euodia does not gate Mneme.

**first-run** — Agora’s one-time foundation path: fetch latest blueprint release, CreateAgent Euodia and Mneme, greet once, quiet. Not `need`. Not the execution pipeline. Marker file: `/workspace/bots/FIRST_RUN` (Agora sole-writes). Not career SoT.

**CreateAgent** — Agora creating a focused child Bot on the same Grok account from an installed blueprint (`profile.md` verbatim + `skills/*.md`). Not template Add, not Duplicate, not a second bot of the same name.
_Avoid_: Add child template, Duplicate Agora

**Career execution** — Zetesis → Hermeneia → Kairos → Melete → Peitho (lazy).

**need protocol** — A stage bot (or the user) that requires another fleet bot sends Agora `need <Name>` with one roster Latin name. Agora creates it if missing and replies with the id. Stage bots never CreateAgent. Quantifiers (`all`, `the rest`) are not `need`. Execution `need` waits until Mneme exists (run first-run first).

**agora repo** — Public GitHub source of truth: `layishsieger/agora`. Holds bot blueprints (`bots/<name>/profile.md`, skills), docs, and the Vercel install-telemetry route. All system authorship lives here.

**blueprint** — Authorship tree in this GitHub repo: `bots/<name>/` (profile, skills, prompts, guides, schemas). Not a public `x.ai/bot` template.
_Avoid_: child template, nested template

**installed blueprint** — Copy on the **Grok Bot computer** after Agora fetches a release: `/workspace/bots/<name>/`, plus a `RELEASE` file (e.g. `v1.2.0`). Same layout as the repo, different machine. Career files stay `/workspace/agora/`. If that bot already exists and `RELEASE` is stale, Agora asks before refresh; it never CreateAgents a second copy.

**blueprint release** — A GitHub Release of this repo (a named snapshot, usually `v1.2.0`). Agora fetches the **latest** release at CreateAgent time and should remember which release it used. A later upgrade skill can compare that to a newer latest. The Agora skill does not pin one version forever.

**installer template** — The one published Grok Bot Add link: Agora. User Adds Agora once; Agora CreateAgents the rest of the flow from blueprints.
_Avoid_: publishing each stage as its own template in v1

**install event** — Anonymous telemetry fired by Agora after a successful CreateAgent (`event=install`, bot name, blueprint-release name, `agora=1`). Not a raw GitHub zip download count. Honors `DO_NOT_TRACK`.

**profile.yaml** — Who is the candidate? Identity only (name, locations, email, optional phone, links). Mneme sole-writes. Path: `/workspace/agora/profile.yaml`.

**preferences.yaml** — What does the candidate want? Mneme sole-writes (Euodia may propose; Mneme persists after confirm). Kairos hints (`emphasize`, `de_emphasize`, `resume_voice`) are stored here, not applied by trimming the master story. Path: `/workspace/agora/preferences.yaml`.

**master-resume.md** — Professional story / evidence. YAML document at a `.md` path. Human+agent authored source of truth. Top-level `variant: master` and `updated`. No contact/objective/target_roles. Optional `variants` are same-fact rephrasings, not per-job forks. Mneme sole-writes. Path: `/workspace/agora/master-resume.md`.

**resume_<company>_<role>.md** — Job-specific presentation of the story. Kairos sole-writes. Path: `/workspace/agora/applications/resume_<company>_<role>.md`.

