# CONTEXT.md

## Glossary

**Agora (Ἀγορά)** — Career-fleet creator and steward. Title chip: Career assembly. Creates, configures, repairs, and upgrades career-fleet bots and skills. Only bot allowed to CreateAgent. After install: first-run greets once, points to Euodia or Mneme, then stays quiet unless asked or a stage bot messages `need <Name>`. Does not do career work. The only public Grok Bot template in v1 (installer). Children are not published as their own templates. Does not do stage-bot jobs in Agora chat.
_Avoid_: telling the user to type `need`; saying Agora keeps career info (that is Mneme / files under `/workspace/agora/`)

**Euodia (Εὐοδία)** — Career Pathfinder and **navigator**. Explores career direction **and** tracks journey stage, seats specialists, owns career routines and Gmail/calendar connectors. Sole-writes `/workspace/agora/journey.md`. A growth plan is later. Optional to *use* when direction is unclear. Does not gate Mneme. Must not CreateAgent; messages Agora if a later bot is needed. Two skills: clarify-direction and navigate-progress.

**Mneme (Μνήμη)** — Career Curator. Interviews, collects experiences, maintains the master career profile (source of truth) **and** `story-bank.md`. Always present after first-run. Must not CreateAgent, tailor resumes, score JDs, search jobs, or apply; on those asks: refuse + DM specialist (`need <Name>` if missing). Refuses those jobs in chat as well as in files.

**Zetesis (Ζήτησις)** — Job Finder. Searches opportunities from profile and preferences. Writes job list under `/workspace/agora/jobs/`. Lazy-created by Agora on demand.

**Hermeneia (Ἑρμηνεία)** — Job Decoder. Analyzes job descriptions; explains requirements, priorities, fit; scores match vs **M** and **N**. Writes `/workspace/agora/jd-bank/`. Lazy-created by Agora on demand.

**Kairos (Καιρός)** — Resume Tailor. Adapts master profile into a job-specific resume under `applications/`. Writes matching simple HTML loader. Lazy-created by Agora on demand. Does not auto-forward to Melete.

**Melete (Μελέτη)** — Interview Coach. Interview prep, practice, feedback. Proposes stories for the story bank. Lazy-created by Agora on demand. Engaged after apply-commit by user or navigator.

**Peitho (Πειθώ)** — Offer Negotiator. Compares and negotiates offers. Writes `/workspace/agora/offer-bank/` and `/workspace/agora/deal-bank/`. Lazy-created by Agora on demand. Navigator opens Peitho on offer.

**Navigator** — Euodia when she tracks journey stage, seats specialists, and owns routines and connectors.

**Stage bot** — A specialist: Zetesis, Hermeneia, Kairos, Melete, or Peitho.

**Gate** — A rule that allows or blocks a forward to the next bot (G1–G9).

**Match score** — Hermeneia fit percent for one job.

**M** — Hard floor for match score. Value: **70%**.

**N** — Forward threshold for match score. Value: **80%**.

**Pointer DM** — Direct message between bots carrying company, role, and path or id only — not a full JD or offer body.

**Career pipeline** — Euodia → Mneme → Zetesis → Hermeneia → Kairos → (user applies) → Melete / Peitho via navigator.

**Career foundation** — Euodia and Mneme (both created on first-run). If the fetched Release has no Euodia `profile.md`, that CreateAgent fails and Mneme is still created. Euodia does not gate Mneme. Navigator exists from first-run with Euodia + Mneme.

**first-run** — Agora’s one-time foundation path: self-materialize Agora playbooks, apply Agora fleet identity (best-effort), then blueprint-fetch Euodia and Mneme from latest (each fetch may see a different latest), CreateAgent both (Mneme even if Euodia fails), apply identity for each created child (best-effort), greet once, quiet. Not `need`. Not the execution pipeline. Marker file: `/workspace/bots/FIRST_RUN` (Agora sole-writes). Not career SoT.

**CreateAgent** — Agora creating a focused child Bot on the same Grok account from an installed blueprint (`profile.md` verbatim + `skills/*.md`). Not template Add, not Duplicate, not a second bot of the same name.
_Avoid_: Add child template, Duplicate Agora

**Career execution** — Zetesis → Hermeneia → Kairos → Melete → Peitho (lazy).

**need protocol** — A stage bot that requires another fleet bot messages Agora `need <Name>` with one roster Latin name. Agora creates it if missing and replies with the id. The user never types `need`; Agora still parses `need <Name>` text for compatibility. Stage bots never CreateAgent. Quantifiers (`all`, `the rest`) are not `need`. Execution `need` waits until Mneme exists (run first-run first). On missing next hop: `need` then **continue** when create is confirmed.
_Avoid_: user-typed `need`; coaching “send `need <Name>`”

**sidebar seating** — On CreateAgent, Agora may pass `section_id` from ListSections when a section display name matches `/^(agora|career)$/i`; otherwise omit `section_id` (leave unassigned). There is no CreateSection API. UpdateAgent cannot move a bot into a section. Missing section never fails create.

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

**template recipe** — Frozen bytes copied on Add: identity name `Agora`, short storefront description (`bots/agora/share-description.md`, not `profile.md`), six enabled public skills `first-run` / `need-bot` / `fetch-blueprint` / `apply-fleet-identity` / `install-telemetry` / `agora-persona`, geometric mark shield + violet. Share `gettingStarted` points at First-run (no separate Getting started skill). Title chip is not in the pack. Not memories, routines, plugins, or the GitHub folder itself. Grok skill slots stay this snapshot until Update template.
_Avoid_: export pack, gallery blurb, pasting `profile.md` as Share description

**Agora persona** — Standing identity skill: the full `bots/agora/profile.md` ONE JOB / roster / anti-jobs text. Not the public Share storefront blurb.

**fleet identity** — Locked title chip plus avatar for Agora or a roster bot. Avatar is pre-authored `bots/<slug>/avatar.png` when present, else a locked geometric (shape + color). Agora applies it (self on first-run; SendToAgent after CreateAgent for children). Children do not own branding skills. Best-effort; never blocks CreateAgent or greeting.

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

**story-bank.md** — Reusable interview stories. Mneme sole-writes (Melete may propose; persist after confirm). Path: `/workspace/agora/story-bank.md`.

**journey.md** — Journey / stage record. Euodia (navigator) sole-writes. Path: `/workspace/agora/journey.md`.

**jobs/** — Job list bank. Zetesis sole-writes. Path: `/workspace/agora/jobs/`.

**jd-bank/** — Decoded JD + match entries. Hermeneia sole-writes. Path: `/workspace/agora/jd-bank/`.

**resume_<company>_<role>.md** — Job-specific presentation of the story. Kairos sole-writes. Path: `/workspace/agora/applications/resume_<company>_<role>.md`. Matching `.html` loader is also Kairos.

**offer-bank/** — Offer facts. Peitho sole-writes. Path: `/workspace/agora/offer-bank/`.

**deal-bank/** — Negotiation state / outcomes. Peitho sole-writes. Path: `/workspace/agora/deal-bank/`.
