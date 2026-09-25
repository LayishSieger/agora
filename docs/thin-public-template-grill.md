# Grill — Thin Agora public template (installer Add link)

Status: **Implemented / closed.** Rounds 1–2 locked; v1 frontier empty; repo matches the letters. Layish still Publishes the live `x.ai/bot/…` link from a new empty Agora (`docs/agents/agora-template-mint.md`). Do not re-grill. Do not mint from this agent.

This grill is the **installer template**: the one published Grok Bot recipe users Add. It is **not** child blueprints (except Agora **self-materialize** of its own authorship tree), not zipball internals, not `/t` protocol, not Euodia/Mneme one-jobs.

Answers: letter + one line if you override the recommendation.

---

## Settled (do not re-ask)

| Decision | Where |
|---|---|
| Only public Grok Bot template in v1 is **Agora** (installer). Children are **not** published as their own templates | ADR 0004, ADR 0006, glossary **installer template** |
| User Adds Agora once; Agora **CreateAgent**s children from GitHub blueprints | ADR 0004, **CreateAgent** |
| Template ships **thin** Agora: persona + create/steward skills — not the whole fleet packed into Add | ADR 0004, `AGORA-PLAN.md` Distribution; **R1-Q1 override** (skills still frozen in the recipe) |
| First-run creates Euodia + Mneme, greets **once**, then quiet; execution bots are lazy `need` | ADR 0003, ADR 0002, `first-run.md`; **R1-Q3 A** (no extra routine; first model turn) |
| Fetch latest **published** Release, not `main`; do not pin a version in the Agora skill | ADR 0007 |
| Agora **self-materialize**: lift fetch-blueprint **Not Agora** for Agora’s own tree only. Extract the **whole** `bots/agora/` tree like children (`profile.md` required; `RELEASE` written). **Running** Grok skill slots stay the Add snapshot — do **not** re-enable or replace them from disk. Run on **first-run**, after resolving latest Release, **before** Euodia/Mneme fetches; if a later steward turn needs a playbook and `prompts/out-of-scope.md` is missing, fetch Agora again. Always **overwrite** `/workspace/bots/agora/` to that Release; **no ask**. Not CreateAgent Agora. Recipe still **freezes** `profile.md` + `first-run` / `need-bot` / `fetch-blueprint`. **Supersedes** the previous “Fetch does not pull Agora” row. | **R1-Q1 override**; **R2-Q9 A**, **R2-Q10 A**, **R2-Q11 A** |
| **Install event** = roster CreateAgent only. Template Add is **not** an install event. First Agora turn / first-run is the registration hook | install-telemetry grill T-R1-Q1 **A**, T-R3-Q2 **A**, ADR 0010 |
| Telemetry URL lives in the skill; `DO_NOT_TRACK` skips; failure never blocks create | T-R1-Q4, ADR 0004 / 0010 |
| First **mint** has **no** telemetry client bytes. `first-run` / `need` skip `/r` `/t` until a later **Update template** (when those recipe files ship) | **R1-Q7 B** |
| Layish owns the template; installing user gets a **fresh** fleet | ADR 0001 |
| Career work is refused in Agora chat | `prompts/out-of-scope.md` |
| Recipe memories: **none**. Strip before Publish / mint from a clean bot | **R1-Q2 A** |
| Add-preview description **is** `profile.md`. Identity / display name field **`Agora`** (no Greek in the name field). No second marketing doc | **R1-Q4 A**, **R2-Q12 A** |
| Visibility: public `https://x.ai/bot/…` share link. Gallery/catalog is nice-to-have, not a v1 gate | **R1-Q5 A** |
| **Update template** only when shipped `bots/agora/` **recipe** files change. Child-only Releases do **not** bump the template | **R1-Q6 A** |
| **No plugins** in the v1 recipe. Anonymous HTTPS zipball. No GitHub/Cursor reconnect on Add | **R1-Q8 A** |
| **Mint vehicle:** new **empty** Grok Bot named Agora. Paste `profile.md`; enable the three public steward skills; no plugins, memories, or routines; Publish public. Not Duplicate staging. Not the working/dev box | **R2-Q13 A** |

Do **not** re-grill: install telemetry rounds 1–3, blueprint fetch contract (except the Q1 lift of **Not Agora** for Agora self-materialize), Euodia v1, steward skill semantics (`first-run` / `need-bot` / `fetch-blueprint`) except the locked self-materialize rows above. Disk `install-telemetry.md` (if a later Release drops it under `bots/agora/skills/`) is **not** a live skill until **Update template** enables it — R1-Q7 **B** + R2-Q9 **A** (do not re-enable disk skills; skip `/r` `/t` until Update).

---

## Round 1 answers (Layish)

| ID | Letter | Note |
|---|---|---|
| R1-Q1 | **OVERRIDE** (closest **C** for fetch) | Steward skills **still ship** in Add (`profile.md` + `first-run`, `need-bot`, `fetch-blueprint`) — **not** ultra-thin bootstrap-only. **Also:** out-of-scope / Agora supporting playbooks materialize the same route as child bots — fetch latest GitHub Release into `/workspace/bots/agora/`. Lift fetch-blueprint **Not Agora** for Agora self-materialize of its own blueprint tree (at least `prompts/out-of-scope.md`). **Not** B (fourth Grok skill only). **Not** paste-only into instructions with no disk file. **Not** pure C (drop steward skills from Add and pull everything live). Explicit: recipe still freezes create/steward skills per ADR 0004. |
| R1-Q2 | **A** | Instructions + skills only. Strip memories before Publish / mint from a clean bot. |
| R1-Q3 | **A** | No extra routine. Profile + skill description is the trigger. First model turn runs first-run. (Briefly picked **B**, then corrected to **A**.) |
| R1-Q4 | **A** | Preview description is `profile.md`. Display name Agora. No second marketing doc. |
| R1-Q5 | **A** | Public `https://x.ai/bot/…` share link. Gallery catalog nice-to-have, not v1 gate. |
| R1-Q6 | **A** | Update template only when shipped `bots/agora/` recipe files change. Child-only Releases do not bump template. |
| R1-Q7 | **B** | Mint without telemetry bytes. first-run/need skip `/r` `/t` until later Update template. |
| R1-Q8 | **A** | No plugins in v1 recipe. Anonymous HTTPS zipball. No GitHub/Cursor reconnect on Add. |

---

## Round 2 answers (Layish)

| ID | Letter | Note |
|---|---|---|
| R2-Q9 | **A** | Whole `bots/agora/` tree like children. Grok skill slots stay the Add snapshot — do not re-enable disk skills. |
| R2-Q10 | **A** | Self-materialize on first-run before child fetches. |
| R2-Q11 | **A** | Always overwrite `/workspace/bots/agora/` to the resolved Release; no ask. |
| R2-Q12 | **A** | Identity / display name field: `Agora`. |
| R2-Q13 | **A** | Publish from a new empty Agora — not Duplicate staging, not working box. |

---

## Facts (looked up; not user questions)

- **Add copies a recipe**, not Layish’s computer: identity, description/instructions, skills, routines, first-party plugins. Not history, learned memory of the source box, attachments, secrets, custom MCP, or scripts. Recipients still **reconnect** plugins. Source: [Templates for Grok Bot](https://x.ai/bot/guides/templates-for-grok-bot) (Palmer, 8 Sep 2026); `docs/agents/grok-bot-install-facts.md`.
- **Share as Template** does not go live until Publish. Then: **public link** or **team-only**. Official docs do **not** require a gallery listing; the product path is `https://x.ai/bot/…` → review → **Add to Grok Bot** (needs the Grok Bot app).
- **Update template** refreshes the **same** URL for **new** Adds. Already-added copies are not live-pushed (`docs/agents/grok-share-template-update.md` — advisor chat, not an ADR).
- **Personal/private skills** do not copy. Steward skills in this repo must be **first-party / public** on the source bot or they will not arrive on Add.
- Platform docs **do not name** `CreateAgent`. Closest official verbs: create a focused Bot, Duplicate, Add. GitHub reconstruct remains this repo’s invention.
- **This branch vs gaps on `main`:** `bots/agora/` has `profile.md`, `skills/first-run.md`, `need-bot.md`, `fetch-blueprint.md`, `prompts/out-of-scope.md`. `install-telemetry.md` is **not** on `main` (grill locked, implement waited / lives on other work). Euodia `profile.md` **is** on `main`. Fetch-contract implement PR may still be open — this grill does not depend on those skill diffs except the **Not Agora** lift decided here.
- `fetch-blueprint.md` today: unknown name, **`Agora`**, or any other folder → **stop**. Child extract is the **whole** `bots/<slug>/` tree; fail closed if `profile.md` is missing. Installed path: `/workspace/bots/<slug>/` + `RELEASE` (ADR 0008). Need-bot still **refuses CreateAgent Agora** — that is unchanged; self-materialize is disk fetch, not CreateAgent.
- First-run already resolves latest Release **once** before Euodia/Mneme fetch. A self-materialize step can share that resolve (author-time; not a user question).

### Language to sharpen later (after close — do not invent in CONTEXT.md this PR)

- Glossary **installer template** remains the Add link. Q4 **A** means there is **no** separate gallery blurb.
- Q1 override **does** split: **frozen recipe** (what Add copies: persona + three steward skills) vs **authorship tree** `bots/agora/` vs **installed** `/workspace/bots/agora/` (playbooks, at least `prompts/out-of-scope.md`). Installed-blueprint language already exists for children; Agora-on-disk is the same machine path with a lifted slug. Do **not** invent `export pack` in `CONTEXT.md` until implement.
- After close: ADR **0015** records the **Not Agora** lift (0011–0014 are the fetch contract). Glossary: **template recipe**, **Agora self-materialize**. Mint checklist: `docs/agents/agora-template-mint.md`. Do **not** invent `export pack`.

---

## Design tree (v1 frontier empty)

```
thin public Agora template
├── what Add copies                    ✓ R1-Q1 override (frozen skills + live playbook fetch)
│   ├── extract scope of bots/agora/   ✓ R2-Q9 A (whole tree; Grok slots frozen)
│   ├── when self-materialize runs     ✓ R2-Q10 A (first-run before children)
│   └── overwrite / RELEASE ask        ✓ R2-Q11 A (always overwrite; no ask)
├── memories in the recipe             ✓ R1-Q2 A
├── first-run trigger                  ✓ R1-Q3 A
├── preview / gallery copy             ✓ R1-Q4 A
│   └── display-name field vs heading  ✓ R2-Q12 A (`Agora`)
├── visibility                         ✓ R1-Q5 A
├── when to Update template            ✓ R1-Q6 A
├── telemetry bytes in first mint      ✓ R1-Q7 B
├── plugins in the recipe              ✓ R1-Q8 A
└── mint vehicle (clean bot vs box)    ✓ R2-Q13 A (new empty Agora)
```

Leftover branches are **out of v1**, not unanswered product calls: avatar art, search keywords, gallery SEO, production telemetry host string (when those recipe files ship), Update-template changelog copy, zipball internals, `/t` fields, child merchandising (ADR 0004 deferred).

**Closed by R1 (do not re-ask):** fourth Grok skill for out-of-scope (**B**); paste-only with no disk file; drop steward skills from Add (pure **C**); curated memories; first-run routine; consent gate; marketing blurb / career-help preview; gallery-as-gate; team-only; Update-on-every-Release; mint-once-never-Update; wait-for-telemetry-before-mint; fetch telemetry skill instead of Update template; GitHub/Cursor plugins.

**Closed by R2 (do not re-ask):** prompts-only extract; live re-enable of disk skills; lazy-only Agora fetch; fetch-Agora on every `need`; ask-before-overwrite Agora files; write-if-missing only; Greek or marketing name in the identity field; Duplicate staging or working-box Publish.

**v1 out of scope** (closed unless you reopen): publishing Euodia/Mneme/Kairos as their own Add links; packing child `bots/<name>/` trees into the Agora **recipe** as an offline fallback; secrets / custom MCP / scripts; routines that CreateAgent Zetesis→Peitho; Duplicate of Layish’s working box (history, logins, career files).

---

## Round 1 (asked; answered above)

❓ **Q1** - **Which repo files are the Add recipe?**

ADR 0004 already says the public template is thin Agora (persona + create/steward skills), not the fleet. The live tree is `bots/agora/`. Grok Add copies whatever is on the **source bot**, not the GitHub folder automatically — implement will mint from a bot that has these files enabled.

**A.** Recipe = `profile.md` as the bot description/instructions, plus **enabled public skills**: `first-run.md`, `need-bot.md`, `fetch-blueprint.md`. `prompts/out-of-scope.md` is **not** its own Grok skill; it ships only if the template instructions field can include it (paste or “instructions”), otherwise first-run/need-bot keep referencing it and we accept Add may not copy a loose `prompts/` file. README and child `bots/*` are **not** in the recipe.

**B.** Same as **A**, but `prompts/out-of-scope.md` **is** a fourth enabled skill so Add is guaranteed to copy the refusal scripts.

**C.** Ultra-thin bootstrap: `profile.md` + **one** bootstrap skill that fetches `bots/agora/` from latest Release, then runs first-run. Steward skills are **not** frozen in the Add snapshot. (This reopens ADR 0004’s “template ships create/steward skills” as a live git pull of Agora itself; `fetch-blueprint.md` today forbids fetching Agora.)

➡️ **A.** Matches ADR 0004 without a new Agora self-fetch path. Refusal copy already lives in the three skills; a fourth skill is optional polish (pick **B** if you want Add details to list “Out of scope”). **C** is a different product (self-updating installer) and fights the current fetch roster.

**Answer: OVERRIDE.** Closest letter **C** for the fetch path only. Steward skills **still ship** in Add (`profile.md` + `first-run`, `need-bot`, `fetch-blueprint`) — not ultra-thin bootstrap. Supporting playbooks (at least `prompts/out-of-scope.md`) fetch from latest Release into `/workspace/bots/agora/` on the same route as children; lift **Not Agora** for that self-materialize. Not B. Not paste-only. Not pure C.

---

❓ **Q2** - **Do we ship memories in the template?**

Palmer: templates may include **relevant memories** and drop personal ones. A source Agora that was used for development will have the wrong memories (Layish’s box, leftover `FIRST_RUN` narrative, career chatter).

**A.** **Instructions + skills only.** Strip memories before Publish (or mint from a clean bot that never chatted). No “remembered” roster/telemetry prose in the recipe.

**B.** Allow a **curated** short memory (e.g. “you are the career-fleet installer”) in addition to `profile.md`.

**C.** Don’t care — Publish from the working Agora; platform anonymization is enough.

➡️ **A.** One written persona (`profile.md`). Dev-box memories are how installers inherit the wrong first-run state. **B** duplicates the profile. **C** is how we accidentally ship `/workspace/agora/` gossip.

**Answer: A.**

---

❓ **Q3** - **What triggers first-run after Add?**

`first-run.md` already says: first turn after template Add, or whenever Euodia/Mneme is missing. Template recipes **can** include routines (triggers). The grok.com share chat wanted “wait for explicit stand-up”; that **contradicts** ADR 0003 (foundation on first-run, not a consent gate).

**A.** **No extra routine.** Profile + skill description is the trigger. The user opens Agora and the first model turn runs first-run (any message, including empty/hello). If they never open Agora, foundation does not run — that is acceptable.

**B.** Also attach a **routine** copied by Add, if the UI lets us, whose only job is “on first conversation, run first-run.” Same first-run semantics; routine is a belt.

**C.** **Wait for explicit consent** (“set up Euodia and Mneme”) before CreateAgent. Do not run first-run on hello.

➡️ **A.** Do not reopen ADR 0003. Routines are extra product surface (when they fire, timezone, failure). **C** leaves a user with a silent installer and no Mneme until they guess the passphrase. **B** is fine later if Add-preview shows a routine you actually want listed.

**Answer: A.** (Briefly **B**, then corrected to **A**.)

---

❓ **Q4** - **Add-preview / gallery text vs `profile.md`**

Add review shows name, description, skills, integrations. `profile.md` is steward voice (anti-jobs, roster, first-run). A friendlier “career coach” blurb would train people to paste resumes into Agora.

**A.** Preview description **is** `profile.md` (verbatim, or truncated by the UI). Display name **Agora**. No second marketing doc.

**B.** Separate **short** preview blurb (installer for a career fleet; one Add; children are created in-app; not a resume writer). After Add, the bot’s instructions remain `profile.md`.

**C.** Gallery/preview sells **career help** (jobs, resumes, interviews). Steward refusals stay only in skills.

➡️ **A** for v1 (one artefact). If the x.ai short field is too small and truncates mid-anti-job, pick **B** — still **not** **C**. **C** fights `out-of-scope.md` and ADR 0001.

**Answer: A.**

---

❓ **Q5** - **Public share link, gallery listing, or team-only?**

**A.** **Public** `https://x.ai/bot/…` share link. Being in any official **gallery/catalog** is nice-to-have, not a v1 gate. Anyone with the link can Add.

**B.** v1 **requires** a gallery/catalog listing (discoverable without the URL).

**C.** **Team-only** until steward skills freeze; no public Add.

➡️ **A.** The product is the Add link. Gallery placement is merchandising we do not control in this repo. **C** blocks the stated v1 distribution. **B** is a launch checklist item, not a recipe decision.

**Answer: A.**

---

❓ **Q6** - **When do we click Update template?**

Child blueprint edits already ship via **GitHub Release** (ADR 0007) without republishing Agora. The Add snapshot of Agora skills is **frozen** until Update template (new Adds only).

**A.** Update template **only** when shipped `bots/agora/` recipe files change (Q1). Child-only Releases do **not** bump the template.

**B.** Update template on **every** GitHub Release, even if Agora files are unchanged.

**C.** Mint once; **never** Update in v1 (bugs wait for a new link or v2).

➡️ **A.** Matches ADR 0007’s split: blueprints move on Releases; installer recipe moves when Agora’s own files move. **B** is busywork and still does not patch existing Adds. **C** leaves a known-bad first-run in the wild with no same-URL fix for new users.

**Answer: A.**

---

❓ **Q7** - **Does the first published recipe include telemetry client bytes?**

Settled: public URL in skill; `/r` before CreateAgent; `/t` after success; Add is not an install event. `install-telemetry.md` is **not** on `main` yet. `need-bot.md` today: if no URL, skip.

**A.** **Do not mint** the public Add link until telemetry client bytes (URL + `/r`/`/t` + `INSTALL_ID`) are in the recipe. Early Adds would never register.

**B.** Mint **without** telemetry bytes. First-run/need skip `/r`/`/t` until a later **Update template** (or until implement lands). Early Adds are invisible to the meter (counts already **untrusted** until rate-limit).

**C.** Recipe never contains telemetry. First-run **fetches** a telemetry skill from GitHub (Agora self-fetch — not allowed by current `fetch-blueprint.md`).

➡️ **B.** Unblocks the Add link; meter was never the install vehicle. Pick **A** if you want user #1 in Blob. **C** is Q1-**C** again.

**Answer: B.**

---

❓ **Q8** - **First-party plugins in the v1 recipe?**

Add copies plugin *slots*; the recipient **reconnects**. Fetch is **anonymous HTTPS** to GitHub (fetch grill F-R1-Q3 **A**). Palmer’s example shipped GitHub + Cursor because that bot used them.

**A.** **No plugins** in the v1 Agora template. Zipball over HTTPS from the Grok computer. No GitHub/Cursor/MCP reconnect step on Add.

**B.** Include **GitHub** (reconnect) so fetch can use `gh` / authenticated API.

**C.** Include GitHub **and** Cursor (or other first-party slots we use while authoring).

➡️ **A.** Auth-gated GitHub was rejected for fetch. Extra plugins show up on Add review and look like a Cursor-dev bot. Reconnect friction is not the installer job.

**Answer: A.**

---

## Round 2 (asked; answered above)

Frontier unblocked by R1-Q1’s self-materialize + leftover mint/identity mapping. Q9–Q11 hang off Q1; Q12 hangs off Q4 **A**; Q13 is the mint vehicle. Disk telemetry vs frozen recipe does **not** need a Round 3: R1-Q7 **B** already skips `/r` `/t` until Update template, and R2-Q9 **A** forbids re-enabling disk skills.

---

❓ **Q9** - **What of `bots/agora/` is extracted onto the Grok computer?**

R1-Q1: same **route** as children (latest Release zip → `/workspace/bots/agora/`), at least `prompts/out-of-scope.md`. Children today extract the **whole** tree and fail without `profile.md`. The Add recipe still **freezes** the three steward skills — those Grok skill slots must not become a live git pull.

**A.** **Whole tree**, same extract rules as children (`profile.md`, `skills/`, `prompts/`, README, …) plus `RELEASE`. Fail closed if `profile.md` is missing in the zip. **Running** Grok skills stay the Add snapshot until Update template. Disk files are for paths the frozen skills already reference (`prompts/out-of-scope.md`). Do **not** re-enable or replace Grok skill slots from the zip. Do **not** CreateAgent Agora.

**B.** **Supporting playbooks only:** extract `prompts/` (required: `out-of-scope.md`; fail if that file is missing). Do **not** write `skills/*.md` or `profile.md` onto disk from the zip (those live only in the frozen recipe). `RELEASE` still recorded. Unknown extra folders under `bots/agora/` stay unused.

**C.** Whole tree **and** first-run/need **re-read / re-enable** disk `skills/*.md` as the live skills (self-updating installer). This **drops** the R1 freeze and is pure-C by another door.

➡️ **A.** Honors “same route as child bots” and “at least out-of-scope.md” without a special extract dialect. Freeze stays on the **Grok skill slots**, not on whether the zip also contains skill markdown. **B** if you do not want newer `first-run.md` sitting on disk next to an older enabled skill (operators will get confused). **C** fights R1-Q1.

**Answer: A.** Whole tree like children; Grok skill slots stay the Add snapshot — do not re-enable disk skills.

---

❓ **Q10** - **When does Agora self-materialize run?**

**A.** On **first-run**, after resolving latest Release, **before** Euodia/Mneme child fetches. If a later steward turn needs a playbook and `/workspace/bots/agora/prompts/out-of-scope.md` is missing, fetch Agora again. `need Agora` is still refuse-CreateAgent; this is not that.

**B.** **Lazy only:** fetch Agora the first time a skill must read a playbook path that is missing. First-run CreateAgent of Euodia/Mneme does not wait on Agora-on-disk.

**C.** **Every** first-run **and** every `need-bot`, always re-fetch Agora to latest (no missing-file check).

➡️ **A.** Refusals on the first user turn need the file on disk before chat work; first-run is already the network round. **B** races the first anti-job message against a missing file. **C** is extra zip traffic on every `need` for no product gain (Q11 owns overwrite).

**Answer: A.** Self-materialize on first-run before child fetches.

---

❓ **Q11** - **Overwrite policy for `/workspace/bots/agora/`**

ADR 0008: if a **child** bot already exists and `RELEASE` is stale, **ask** before refresh. Agora is not CreateAgent’d; there is no leftover child to protect.

**A.** Always write/overwrite `/workspace/bots/agora/` to the Release just resolved (no user ask). Record `RELEASE`. Same as a first-time child extract, every time self-materialize runs.

**B.** Same as children: if `RELEASE` exists and is older than latest, **ask** before overwrite.

**C.** Write only when dest files are **missing**; never overwrite an existing `prompts/out-of-scope.md`.

➡️ **A.** Playbooks should match the same Release as the children you are about to CreateAgent. Asking the installer user “refresh Agora files?” is ceremony, not a second bot. **C** freezes a stale refusal script on disk forever. **B** if you want the human to see skill-markdown diffs; that is mostly noise under Q9 **A** because Grok slots stay frozen anyway.

**Answer: A.** Always overwrite `/workspace/bots/agora/` to the resolved Release; no ask.

---

❓ **Q12** - **Grok identity name field vs `profile.md` heading**

R1-Q4 **A**: display name **Agora**; preview description is `profile.md`. The profile heading is `Agora (Ἀγορά) — …`. Avatar art stays deferred.

**A.** Identity name field is exactly **`Agora`** (no Greek, no subtitle). Instructions/description carry the heading as written in `profile.md`.

**B.** Identity name field is **`Agora (Ἀγορά)`** to match the profile H1.

**C.** Identity name field is a longer label (e.g. `Agora — career fleet installer`).

➡️ **A.** Matches the letter you already gave. Greek lives in the profile body. **C** is a second marketing name after you refused a second marketing doc.

**Answer: A.** Identity / display name field: `Agora`.

---

❓ **Q13** - **What bot do we Publish from?**

R1-Q2 **A**: strip memories / mint from a clean bot. Palmer: Add copies that source bot’s recipe.

**A.** **New empty** Grok Bot named Agora (never used for career chat). Paste `profile.md` into instructions/description; enable the three public steward skills from repo files; no plugins; no memories; no routines; Publish public. Do **not** Publish Layish’s working/dev Agora.

**B.** **Duplicate** a staging Agora that was built from those files, then strip memories, then Publish (Duplicate already drops history; still check memories).

**C.** Publish from the **working** Agora after a strip checklist.

➡️ **A.** Least way to ship `/workspace/agora/` gossip. **B** is acceptable if the UI makes empty-bot skill enable painful — still not **C**. **C** is R1-Q2 **C** with extra steps.

**Answer: A.** Publish from a new empty Agora — not Duplicate staging, not working box.

---

## Landed (implement)

- Skills: `bots/agora/skills/fetch-blueprint.md`, `first-run.md`, `need-bot.md`
- ADR **0015**; ADR **0008** notes Agora overwrite has no ask
- Mint: `docs/agents/agora-template-mint.md`
- Glossary: **template recipe**, **Agora self-materialize**; **installed blueprint** allows disk Agora

---

## v1 author checklist (done in repo)

- **Mint (Layish):** new empty Grok Bot, identity name `Agora`, instructions = `profile.md`, enable public `first-run` / `need-bot` / `fetch-blueprint`, no memories, no routines, no plugins, Publish public `https://x.ai/bot/…`. Never Publish the working box. Follow `docs/agents/agora-template-mint.md`.
- **Skills:** **Not Agora** lifted for self-materialize only; first-run fetches whole `bots/agora/` before children; overwrite + `RELEASE`; do not re-enable disk skills; do not CreateAgent Agora. Telemetry client skipped until Update template.
- **Docs:** ADR **0015**; glossary terms above.

---

## Stop

Grill closed. Repo skills and docs match. **Do not mint** the live Add link from this agent. Wait for Layish to Publish from a new empty Agora.
