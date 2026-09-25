# Grill — Career-execution stubs (Zetesis → Hermeneia → Kairos → Melete → Peitho)

**Status:** Round 1 **open**. Grill only. **Do not implement** `bots/zetesis|hermeneia|kairos|melete|peitho/` blueprints until Layish says **implement**.

**Scope:** Decisions needed to **author stubs** — creatable GitHub trees Agora can fetch and CreateAgent. Not full product depth per bot (no job-board product, no JD rubric, no interview curriculum, no compensation model).

**Not this grill:** thin public Agora template, blueprint fetch contract, install telemetry, Euodia/Mneme one-jobs, first-run creating execution bots, publishing children as their own templates.

Answers: letter + one line if you override the recommendation. The Agora Grok bot will ask **one question at a time**.

---

## Settled (do not re-ask)

| Decision | Where |
|---|---|
| Agora = thin installer; only Agora CreateAgent | ADR 0001, 0002, 0004, 0006 |
| Children from latest GitHub Release + CreateAgent, not child Add links | ADR 0004, 0006, 0007 |
| First-run = Euodia + Mneme only; execution is lazy `need <Name>` | ADR 0003, `first-run.md` |
| Execution `need` waits until Mneme exists | glossary **need protocol**, `need-bot.md` |
| Progression: Find direction → Know yourself → Find opportunities → Understand them → Position → Prepare → Negotiate | `AGORA-PLAN.md` |
| One-jobs: Zetesis Job Finder · Hermeneia Job Decoder · Kairos Resume Tailor · Melete Interview Coach · Peitho Offer Negotiator | `AGORA-PLAN.md` Roster |
| Never fabricate. Never apply on the user’s behalf | `AGORA-PLAN.md` Decisions; Mneme/Euodia anti-jobs |
| Mneme sole-writes master profile files; Kairos sole-writes `applications/resume_<company>_<role>.md` | ADR 0005, glossary |
| README-only is **not** a creatable blueprint (`missing_profile`) | `fetch-blueprint.md`; F-R2-Q3 **B** |
| Zero `skills/*.md` is **allowed** if `profile.md` exists | `need-bot.md` step 7 |
| CreateAgent: name = canonical Latin Name; description = fetched `profile.md` **verbatim** (do not paraphrase) | `need-bot.md` |
| Fetch extracts the **whole** `bots/<slug>/` tree; child reads `prompts/` / `guides/` / `schemas` from disk | ADR 0008, `need-bot.md` |
| Child-only Releases do **not** Update the Agora template | thin-template **R1-Q6 A** |
| Stage bots never CreateAgent; they message Agora `need <Name>` (one Latin name) | ADR 0002 |
| Do not reopen fetch zipball, telemetry `/r` `/t`, or the installer Add recipe | those grills |

---

## Facts (looked up; not user questions)

- **On `main` today:** each execution folder is only `README.md` (`Stub — grilled later.`). No `profile.md`. `need Zetesis` against a Release of this tree would **fail** fetch (`missing_profile`). First-run would still CreateAgent Euodia + Mneme if those `profile.md`s are in the Release.
- **Euodia (pattern for a thin child):** `profile.md` (~1.8k) + one skill `skills/clarify-direction.md` + `prompts/out-of-scope.md` + README. No `schemas/`, no `guides/`.
- **Mneme (full foundation, not a stub):** extra prompts, `guides/`, `schemas/`. Do not copy that richness into execution stubs unless a later product grill says so.
- **Agora `profile.md` is shorter** (~1k) because steward how-to lives in skills.
- **Zero GitHub Releases** on `LayishSieger/agora` at grill time. Fetch of latest is `no_release` until one exists. Whether stubs ship in that first Release is Q7.
- **Grok Bot profile fields** (Edit Profile): name, **title** (label), description, avatar. Official docs do **not** name `CreateAgent` and do **not** state a description character limit. `need-bot` today sets **name + description only**; Title is unset unless we add wiring. English titles already live in `AGORA-PLAN.md` and in Euodia/Mneme H1s (`# Euodia (Εὐοδία) — Career Pathfinder`).
- **Atomic replace:** extras under `/workspace/bots/<slug>/` vanish on the next successful fetch (ADR 0012). Career artifacts must not live in the blueprint folder.
- **Euodia/Mneme already name execution bots** in refusals (`need Zetesis`, `need Hermeneia`, `need Kairos`, `need Melete`). Stubs do not change that.
- **`AGORA-PLAN.md` Next** still says execution stubs stay later (written before this frontier). Wayfinding only; not a product lock.

---

## Design tree (Round 1 frontier)

```
execution stubs
├── stub depth (creatable files)          ← Q1
│   └── extra in-scope prompts/?          ← Q2
├── Title field vs profile.md H1          ← Q3
├── profile.md shape / length             ← Q4
├── naive one-job vs refuse-until-full    ← Q5
├── durable files in stub round           ← Q6
├── need-next handoffs in stubs           ← Q7
├── first Release includes stubs?         ← Q8
└── authoring batch                       ← Q9
```

**Later (not this round — hang off answers):** skill filenames if Q1 is not profile-only; shared `_shared/` layout (would reopen fetch); Zetesis browse/tools; Hermeneia rubric; Kairos HTML/PDF; Melete STAR curriculum; Peitho comp bands; avatars; child templates (ADR 0006).

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

❓ **Q3** - **CreateAgent Title vs Name vs `profile.md`?**

Platform: Name, Title, Description. Today: Name = `Zetesis` (etc.); Description = entire `profile.md`; Title unset. Thin-template already locked Agora’s **display name** as `Agora` (no Greek in the name field). Children are not templates; this is CreateAgent on the user’s account.

**A.** **Do not add Title wiring.** Name stays the Latin roster Name. English title + Greek stay in the `profile.md` H1, same as Euodia (`# Zetesis (Ζήτησις) — Job Finder`). No `title` file. `need-bot` unchanged.

**B.** Stubs add a one-line title source (`title: Job Finder`) and **this stub implement** also teaches `need-bot` to set the Title field from it. Description remains full `profile.md`.

**C.** Put the English title in the **Name** field (`Zetesis — Job Finder` or `Job Finder`). Breaks exact Latin `need` matching.

**D.** Ultra-short Description (title + one-job only); dump the rest into the skill so CreateAgent stays tiny. Title still unset.

➡️ **A** — Matches foundation bots; does not reopen steward skills in the stub PR. Sidebar Title can wait. **C** fights the need protocol. **B** is polish, not required to author stubs.

---

❓ **Q4** - **How fat is stub `profile.md`?**

Euodia ~1.8k, Mneme ~2.3k, Agora ~1k. Docs state no description cap. `need-bot` pastes the **whole** file into Description.

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

**A.** **Refuse + redirect, on ask.** Anti-job table lists every sibling. If the user asks for another roster job: refuse in this chat, message that bot if it exists, else Agora `need <Name>`. **Forward** next (Zetesis→Hermeneia→Kairos→Melete→Peitho) the same way — only when they ask to move on, not when the stub “thinks” the stage is done. Never `need all`. Never CreateAgent.

**B.** Name the sibling in the refusal line only. **Do not** message Agora. User types `need` themselves.

**C.** When the stub believes the stage is complete, **automatically** `need` the next bot (search done → create Hermeneia, etc.).

**D.** No sibling names in stubs except “ask Agora.” Handoffs wait for full-product grills.

➡️ **A** — Same as Euodia; satisfies ADR 0002 without standing up the whole execution chain. **C** is bulk-create by stealth. **B** fights the existing “don’t tell them to type `need`” rule. **D** leaves a specialist that will do the next job itself.

---

❓ **Q8** - **Does the first published Release include these stubs?**

No Release exists yet. First-run **never** CreateAgents execution bots, even if `profile.md` is in the zip. Child-only Release does not bump the Agora template.

**A.** **Yes, once implemented.** The first published Release that installers fetch may include creatable execution trees so `need Zetesis` works after foundation. First-run still only Euodia + Mneme.

**B.** First Release is foundation-only (Agora + Euodia + Mneme trees). Execution stubs wait for a **later** Release. Until then `need` of those names is `missing_profile`.

**C.** Ship stub files in git but teach `need-bot` to **refuse** execution CreateAgent until a “full” flag exists.

➡️ **A** — Lazy `need` should not be a guaranteed fail after the first tag. **C** reopens steward skills for a lock we do not need. **B** is only if you mint a Release **before** stub implement.

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
