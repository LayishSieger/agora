# CONTEXT.md

## Glossary

**Agora (Ἀγορά)** — Career-fleet creator and steward. Creates, configures, repairs, and upgrades career-fleet bots and skills. Only bot allowed to CreateAgent. After install: first-run greets once, points to Euodia or Mneme, then stays quiet unless asked or messaged `need <Name>`. The only public Grok Bot template in v1 (installer). Children are not published as their own templates. Does not do stage-bot jobs in Agora chat.

**Euodia (Εὐοδία)** — Career Pathfinder. Explores career direction. A growth plan is later. Optional to *use* when direction is unclear. Does not gate Mneme. Must not CreateAgent; messages Agora if a later bot is needed.

**Mneme (Μνήμη)** — Career Curator. Interviews, collects experiences, maintains the master career profile (source of truth). Always present after first-run. Must not CreateAgent, tailor resumes, score JDs, search jobs, or apply; messages Agora `need <Name>` if a later bot is needed. Refuses those jobs in chat as well as in files.

**Zetesis (Ζήτησις)** — Job Finder. Searches opportunities from profile and preferences. Lazy-created by Agora on demand.

**Hermeneia (Ἑρμηνεία)** — Job Decoder. Analyzes job descriptions; explains requirements, priorities, fit. Lazy-created by Agora on demand.

**Kairos (Καιρός)** — Resume Tailor. Adapts master profile into a job-specific resume. Lazy-created by Agora on demand.

**Melete (Μελέτη)** — Interview Coach. Interview prep, practice, feedback. Lazy-created by Agora on demand.

**Peitho (Πειθώ)** — Offer Negotiator. Offer understanding and negotiation support. Lazy-created by Agora on demand.

**Career pipeline** — Euodia → Mneme → Zetesis → Hermeneia → Kairos → Melete → Peitho.

**Career foundation** — Euodia and Mneme (both created on first-run). If the fetched Release has no Euodia `profile.md`, that CreateAgent fails and Mneme is still created. Euodia does not gate Mneme.

**first-run** — Agora’s one-time foundation path: self-materialize Agora playbooks, then blueprint-fetch Euodia and Mneme from latest (each fetch may see a different latest), CreateAgent both (Mneme even if Euodia fails), greet once, quiet. Not `need`. Not the execution pipeline. Marker file: `/workspace/bots/FIRST_RUN` (Agora sole-writes). Not career SoT.

**CreateAgent** — Agora creating a focused child Bot on the same Grok account from an installed blueprint (`profile.md` verbatim + `skills/*.md`). Not template Add, not Duplicate, not a second bot of the same name.
_Avoid_: Add child template, Duplicate Agora

**Career execution** — Zetesis → Hermeneia → Kairos → Melete → Peitho (lazy).

**need protocol** — A stage bot (or the user) that requires another fleet bot sends Agora `need <Name>` with one roster Latin name. Agora creates it if missing and replies with the id. Stage bots never CreateAgent. Quantifiers (`all`, `the rest`) are not `need`. Execution `need` waits until Mneme exists (run first-run first).

**agora repo** — Public GitHub source of truth: `layishsieger/agora`. Holds bot blueprints (`bots/<name>/profile.md`, skills), docs, and the Vercel install-telemetry route. All system authorship lives here.

**blueprint** — Authorship tree in this GitHub repo: `bots/<name>/` (profile, skills, prompts, guides, schemas). Not a public `x.ai/bot` template.
_Avoid_: child template, nested template

**blueprint fetch** — Agora copying **one** slug (a roster child, or Agora for disk playbooks) from the latest **blueprint release** onto the Grok computer. Not CreateAgent. Not an install event. v1 has no restore to an older tag.
_Avoid_: clone main, pin, zip the whole repo onto disk

**installed blueprint** — Snapshot of that slug on the **Grok Bot computer**: `/workspace/bots/<name>/` matching the shipped tree for one blueprint release, plus `RELEASE` (`tag_name` only). Not a union of releases. A failed fetch leaves the previous snapshot. Career files stay `/workspace/agora/`. Children: if that bot already exists and `RELEASE` is stale, Agora asks before refresh; it never CreateAgents a second copy. Agora-on-disk is playbooks only (never CreateAgent Agora).
_Avoid_: treating disk Agora as a roster `need`

**blueprint release** — A GitHub Release of this repo (a named snapshot, usually `v1.2.0`). Agora fetches the **latest** published release (not a draft, not a prerelease, not `main`) and records its `tag_name` in `RELEASE`. A later upgrade skill can compare that to a newer latest. The Agora skill does not pin one version forever.

**installer template** — The one published Grok Bot Add link: Agora. User Adds Agora once; Agora CreateAgents the rest of the flow from blueprints.
_Avoid_: publishing each stage as its own template in v1

**template recipe** — Frozen bytes copied on Add: identity name `Agora`, `profile.md` as instructions, enabled public skills `first-run` / `need-bot` / `fetch-blueprint`. Not memories, routines, plugins, or the GitHub folder itself. Grok skill slots stay this snapshot until Update template.
_Avoid_: export pack, gallery blurb

**Agora self-materialize** — Fetch of `bots/agora/` from the latest Release onto `/workspace/bots/agora/` so playbooks exist on disk. Not CreateAgent Agora. Running Grok skills stay the **template recipe**.
_Avoid_: need Agora, live skill pull

**install id** — Opaque token for one Agora installation. Client-minted; Agora sole-writes `/workspace/bots/INSTALL_ID`. Not an account, person, or child bot id. Required on every **install event**.
_Avoid_: account id, bot id

**Agora registration** — Record that an Agora installer is in use, upserted on first turn if the local install id is missing, before CreateAgent. Distinct from an **install event**. Honors `DO_NOT_TRACK` (skip registration and install events; CreateAgent still runs).
_Avoid_: treating template Add as an install event

**install event** — Ping after a successful CreateAgent: `event=install`, roster bot name, blueprint-release name, `agora=1`, and a valid **install id**. Not template Add, not blueprint fetch, not upgrade-in-place, not a GitHub zip count; no account, career files, or IP/UA as product data. Honors `DO_NOT_TRACK`.
_Avoid_: installer Add event, fetch telemetry

**profile.yaml** — Who is the candidate? Identity only (name, locations, email, optional phone, links). Mneme sole-writes. Path: `/workspace/agora/profile.yaml`.

**preferences.yaml** — What does the candidate want? Mneme sole-writes (Euodia may propose; Mneme persists after confirm). Kairos hints (`emphasize`, `de_emphasize`, `resume_voice`) are stored here, not applied by trimming the master story. Path: `/workspace/agora/preferences.yaml`.

**master-resume.md** — Professional story / evidence. YAML document at a `.md` path. Human+agent authored source of truth. Top-level `variant: master` and `updated`. No contact/objective/target_roles. Optional `variants` are same-fact rephrasings, not per-job forks. Mneme sole-writes. Path: `/workspace/agora/master-resume.md`.

**resume_<company>_<role>.md** — Job-specific presentation of the story. Kairos sole-writes. Path: `/workspace/agora/applications/resume_<company>_<role>.md`.
