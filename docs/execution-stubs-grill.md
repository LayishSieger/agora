# Grill — Career-execution stubs (Zetesis → Hermeneia → Kairos → Melete → Peitho)

**Status:** Round 1 **open**. Grill only. **Do not implement** `bots/zetesis|hermeneia|kairos|melete|peitho/` blueprints until Layish says **implement**.

**Scope:** Decisions needed to **author stubs** — creatable GitHub trees Agora can fetch and CreateAgent. Not full product depth per bot (no job-board product, no JD rubric, no interview curriculum, no compensation model).

**Not this grill:** thin public Agora template, blueprint fetch contract, install telemetry, Euodia/Mneme one-jobs, first-run creating execution bots, publishing children as their own templates, fleet-identity title chips / avatars (ADR 0016).

Answers: letter + one line if you override the recommendation. The Agora Grok bot will ask **one question at a time**.

---

## Settled (do not re-ask)

| Decision | Where |
|---|---|
| Agora = thin installer; only Agora CreateAgent | ADR 0001, 0002, 0004, 0006 |
| Children from latest GitHub Release + CreateAgent, not child Add links | ADR 0004, 0006, 0007 |
| First-run = Euodia + Mneme only; execution is lazy `need <Name>` | ADR 0003, `first-run.md` |
| Execution `need` waits until Mneme exists | glossary **need protocol**, `need-bot.md` |
| User never types `need`; stage bots message Agora; Agora does not coach the user to type `need` | ADR 0017, `need-bot.md`, glossary |
| Progression: Find direction → Know yourself → Find opportunities → Understand them → Position → Prepare → Negotiate | `AGORA-PLAN.md` |
| One-jobs: Zetesis Job Finder · Hermeneia Job Decoder · Kairos Resume Tailor · Melete Interview Coach · Peitho Offer Negotiator | `AGORA-PLAN.md` Roster |
| Never fabricate. Never apply on the user’s behalf | `AGORA-PLAN.md` Decisions; Mneme/Euodia anti-jobs |
| Mneme sole-writes master profile files; Kairos sole-writes `applications/resume_<company>_<role>.md` | ADR 0005, glossary |
| README-only is **not** a creatable blueprint (`missing_profile`) | `fetch-blueprint.md`; F-R2-Q3 **B** |
| Zero `skills/*.md` is **allowed** if `profile.md` exists | `need-bot.md` step 7 |
| CreateAgent: name = canonical Latin Name; description = fetched `profile.md` **verbatim** (do not paraphrase); optional `section_id` from ListSections | `need-bot.md`, ADR 0017 |
| Fetch extracts the **whole** `bots/<slug>/` tree; child reads `prompts/` / `guides/` / `schemas` from disk | ADR 0008, `need-bot.md` |
| Child-only Releases do **not** Update the Agora template | thin-template **R1-Q6 A** |
| Stage bots never CreateAgent; they message Agora `need <Name>` (one Latin name) | ADR 0002 |
| **Title chips** for all roster Names (incl. Zetesis→Peitho) are set by **Apply fleet identity** after CreateAgent (locked map). CreateAgent/UpdateAgent set **name + description only**. Stubs do **not** add a `title` file or teach `need-bot` a new Title path. English one-job still lives in `profile.md` H1 (same as Euodia). | ADR 0016, `apply-fleet-identity.md`, `prompts/identity-map.md` |
| Do not reopen fetch zipball, telemetry `/r` `/t`, or the installer Add recipe | those grills |

---

## Facts (looked up; not user questions)

- **On `main` today:** each execution folder is only `README.md` (`Stub — grilled later.`). No `profile.md`. `need Zetesis` against the current latest Release **fails** fetch (`missing_profile`). First-run CreateAgents Euodia + Mneme from latest (Euodia tree is complete on disk and in Release).
- **Euodia (pattern for a thin child):** `profile.md` (~2.3k) + one skill `skills/clarify-direction.md` + `prompts/out-of-scope.md` + README. No `schemas/`, no `guides/`.
- **Mneme (full foundation, not a stub):** extra prompts, `guides/`, `schemas/`. Do not copy that richness into execution stubs unless a later product grill says so.
- **Agora `profile.md` is shorter** (~1k) because steward how-to lives in skills.
- **Releases exist:** `v0.1.0` and `v0.1.1` (latest). Latest includes Euodia `profile.md` + skill + out-of-scope, and execution folders as README-only. Fetch of latest is **not** `no_release`. Whether the **next** Release after stub implement includes creatable execution trees is **Q8**.
- **Grok Bot profile fields** (Edit Profile): name, **title** (label), description, avatar. CreateAgent sets name + description. Title + avatar for children go through **Apply fleet identity** (SendToAgent), already mapped for all five execution Names. Official docs do **not** name `CreateAgent` and do **not** state a description character limit.
- **Atomic replace:** extras under `/workspace/bots/<slug>/` vanish on the next successful fetch (ADR 0012). Career artifacts must not live in the blueprint folder.
- **Euodia/Mneme already name execution bots** in refusals (`need Zetesis`, `need Hermeneia`, `need Kairos`, `need Melete`, and Peitho where relevant). Stubs do not change that.
- **Install telemetry client bytes** are on `main` (#13). Do not reopen the `/r` `/t` contract here. Layish still Publishes / Updates the template and may mint a post-telemetry Release separately from this grill.
- **`AGORA-PLAN.md` Next** on this branch points at this grill as the stub frontier (wayfinding only; not a product lock).

---

## Design tree (Round 1 frontier)

```
execution stubs
├── stub depth (creatable files)          ← Q1
│   └── extra in-scope prompts/?          ← Q2
├── Title field vs profile.md H1          ← settled (ADR 0016) — was Q3
├── profile.md shape / length             ← Q4
├── naive one-job vs refuse-until-full    ← Q5
├── durable files in stub round           ← Q6
├── need-next handoffs in stubs           ← Q7
├── next Release includes stubs?          ← Q8
└── authoring batch                       ← Q9
```

**Later (not this round — hang off answers):** skill filenames if Q1 is not profile-only; shared `_shared/` layout (would reopen fetch); Zetesis browse/tools; Hermeneia rubric; Kairos HTML/PDF; Melete STAR curriculum; Peitho comp bands; avatars assets PR; child templates (ADR 0006).

**Out of this grill even later:** packing execution trees into the Agora Add recipe; first-run CreateAgent of Zetesis–Peitho; `need all`.

---

## Round 1

❓ **Q1** - **Stub depth (what files make a creatable execution bot)?**

Fetch fails without `profile.md`. `need-bot` will CreateAgent from description alone if there are zero skills. Euodia is the existing thin-child shape.

**A.** **Profile-only.** `profile.md` + README. No `skills/`, no `prompts/`. CreateAgent works. Behavior is the model plus the description. Refusals live in `profile.md`.

**B.** **Euodia-shaped stub for all five:** `profile.md` + **exactly one** skill (thin one-job playbook) + `prompts/out-of-scope.md` + README. No `schemas/`, no `guides/`, no extra in-scope prompts in this round (see Q2). Skill names at implement (not a second product grill): `find-jobs.md`, `decode-job.md`, `tailor-resume.md`, `coach-interview.md`, `negotiate-offer.md`.

**C.** Profile + one skill, **no** `prompts/` directory — refusals only in profile and skill.

**D.** Mneme-shaped now (multiple prompts, guides, schemas) — “stub” in name only.

➡️ **B** — Same install path as Euodia; out-of-scope stays a disk playbook the child can open; one skill so CreateAgent is not a blank specialist. **A** CreateAgents a bot that will improvise the one-job (fabricate / apply risk). **D** is five product grills, not stubs.

---

❓ **Q2** - **Extra `prompts/` beyond out-of-scope in this stub round?**

Melete and Peitho are dialogue-shaped; a practice script or offer-read script is tempting. That is product depth.

**A.** All five: only `prompts/out-of-scope.md`. No interview drill, offer email, or JD-paste prompt files until a later per-bot grill.

**B.** All five get out-of-scope; **Melete and Peitho** also get **one** in-scope prompt each in this round.

**C.** No `prompts/` for anyone (only valid if Q1 is **A** or **C**).

➡️ **A** — Keep the stub contract identical. Extra prompts are the next grill per bot, not the stub batch.

---

❓ **Q3** - **CreateAgent Title vs Name vs `profile.md`?** — **SETTLED (do not answer)**

Closed by ADR 0016 / Apply fleet identity (already on `main`): title chips for Zetesis–Peitho are already in the locked map (`Job finder`, `Job decoder`, …). CreateAgent stays name + description. Stubs put English title + Greek in the `profile.md` H1 like Euodia. No `title` file. No stub-PR change to `need-bot` for Title.

---

❓ **Q4** - **How fat is stub `profile.md`?**

Euodia ~2.3k, Mneme ~2.8k, Agora ~1k. Docs state no description cap. `need-bot` pastes the **whole** file into Description.

**A.** **Euodia-sized:** ONE JOB, voice, anti-jobs table (siblings + never apply + never fabricate + never CreateAgent), pointer to the one skill (if Q1 **B**/**C**), “how to work” at a glance. Do **not** paste the full skill into `profile.md`.

**B.** Agora-short: one-job + three anti-job lines. Everything else only in the skill (fails if Q1 **A**).

**C.** Long operational spec in `profile.md` (full workflow) so the bot works even with zero skills.

➡️ **A** — Description holds durable rules; skill holds the session. **C** duplicates and makes Description a novel.

---

❓ **Q5** - **May a stub actually do its one-job, or only refuse until a later grill?**

If someone `need`s Kairos after this ships, they will paste a JD.

**A.** **Naive one-job, brakes on.** The stub **does** the roster job in a file-light way: Zetesis may look for openings in conversation; Hermeneia may explain a pasted JD; Kairos may write the applications path; Melete may run a practice exchange; Peitho may talk an offer. No schemas, no specialized tools, no quality rubric. Anti-jobs still hard-refuse (apply, fabricate, CreateAgent, sibling jobs, Mneme’s files).

**B.** Stub **refuses its own job**: “playbook later.” CreateAgent succeeds; the bot is a named brick.

**C.** Conversation-only for all five — **including Kairos** (no `applications/` writes until a Kairos product grill). Conflicts with ADR 0005 if they still expect a resume file.

➡️ **A** — Otherwise lazy create is theater. Quality bars, tools, and schemas are later grills. **B** trains users that `need` is broken. **C** leaves Kairos with no legal write.

---

❓ **Q6** - **Which durable career files may stubs write?**

Atomic replace wipes `/workspace/bots/<slug>/`. Master files are Mneme’s. Kairos path is already in the glossary.

**A.** **Kairos only**, and only `/workspace/agora/applications/resume_<company>_<role>.md`. Zetesis, Hermeneia, Melete, Peitho: **chat (and DMs) only** in this round. No listings file, no decode note file, no prep doc, no offer log. Do not scaffold new paths under `/workspace/agora/`.

**B.** Allow new working files per bot under `/workspace/agora/` now (e.g. `opportunities.md`, `decodes/`, `interview-prep/`, `offers/`) as part of stubs.

**C.** Write working files under `/workspace/bots/<slug>/` so they sit with the blueprint.

➡️ **A** — New SoT paths need a domain grill + `CONTEXT.md`. **B** smuggles a filesystem product into stubs. **C** is deleted on the next fetch.

---

❓ **Q7** - **Handoffs: do stubs `need` the next bot?**

ADR 0002: stage bots must know the next name. Euodia already messages Agora `need <Name>` when the user asks for a sibling job; it does **not** tell the user to type `need` themselves. Quantifiers stay refused.

**A.** **Refuse + redirect, on ask.** Anti-job table lists every sibling. If the user asks for another roster job: refuse in this chat, message that bot if it exists, else Agora `need <Name>`. **Forward** next (Zetesis→Hermeneia→Kairos→Melete→Peitho) the same way — only when they ask to move on, not when the stub “thinks” the stage is done. Never `need all`. Never CreateAgent. Never coach the user to type `need`.

**B.** Name the sibling in the refusal line only. **Do not** message Agora. User types `need` themselves.

**C.** When the stub believes the stage is complete, **automatically** `need` the next bot (search done → create Hermeneia, etc.).

**D.** No sibling names in stubs except “ask Agora.” Handoffs wait for full-product grills.

➡️ **A** — Same as Euodia; satisfies ADR 0002 without standing up the whole execution chain. **C** is bulk-create by stealth. **B** fights ADR 0017 / “don’t coach them to type `need`.” **D** leaves a specialist that will do the next job itself.

---

❓ **Q8** - **Does the next published Release after stub implement include these stubs?**

`v0.1.1` (latest) already shipped foundation + README-only execution folders. First-run **never** CreateAgents execution bots, even if `profile.md` is in the zip. Child-only Release does not bump the Agora template.

**A.** **Yes, once implemented.** The next published Release that installers fetch should include creatable execution trees so `need Zetesis` works after foundation. First-run still only Euodia + Mneme.

**B.** Keep shipping foundation-only creatable trees for one or more Releases after stub files land on `main`. Until a later tag, `need` of those names stays `missing_profile`.

**C.** Ship stub files in git but teach `need-bot` to **refuse** execution CreateAgent until a “full” flag exists.

➡️ **A** — Lazy `need` should not stay a guaranteed fail after stubs are authored and tagged. **C** reopens steward skills for a lock we do not need. **B** only if you deliberately mint a Release from `main` **before** stub implement (or omit the trees from the tag).

---

❓ **Q9** - **Authoring batch after this grill closes?**

This grill is the **stub contract** for all five, not five product specs.

**A.** **One implement PR:** all five Euodia-shaped (or whatever Q1–Q2 chose) trees together. Later: separate product grills (Zetesis browse, Hermeneia rubric, …).

**B.** Five implement PRs in pipeline order, each its own review, still stub-depth only.

**C.** Two batches: Zetesis+Hermeneia, then Kairos+Melete+Peitho.

➡️ **A** — The files are copies of one contract. Splitting review does not add product truth. Per-bot depth is a later frontier, not five stub PRs.

---

## Stop

Do not author `bots/*/profile.md` (execution) or change `need-bot` until **implement**. Round 2 only after these letters land (skill filenames if Q1 ≠ **B**, any override that reopens steward skills, etc.).
