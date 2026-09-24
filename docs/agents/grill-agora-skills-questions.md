# Grill — Author Agora steward skills

Skill bodies are **not** written until this grill is settled or you say proceed.

Round 1 (GitHub zip / CreateAgent mechanics) is **paused**. Layish asked to check official install first. Facts: `docs/agents/grok-bot-install-facts.md`.

Layish also shared a Grok.com chat (capture: `docs/agents/grok-share-template-update.md`): that Grok advised **publish the installer template only**, pin GitHub blueprints, **CreateAgent** children in-app; child templates optional merchandising; **Update template** keeps the same `x.ai/bot` URL. That is **not** recorded as Agora’s decision until he maps it onto Round 2 letters.

**Still true unless you contradict:** thin public Agora template; only Agora coordinates fleet create; first-run aims at Euodia + Mneme then greet/quiet; later bots via `need <Name>`; Mneme grilled on main; Euodia stub; telemetry hosting and Agora template *publish* later.

**Conflicts if we switch to template Add:** ADR 0004 §3 (fetch zip then CreateAgent) and §5 (independent child templates deferred to v2). Do not rewrite those ADRs until you pick a letter below.

---

## Round 2 — install vehicle (answer this before round 1)

❓ **Q1** - **Install vehicle**: For a user who already added thin Agora, how may Agora cause Euodia, Mneme, or a later stage bot to exist?

- **A.** **Official template only.** Agora’s job is to hand (or open) the canonical `https://x.ai/bot/{id}` for that name. The user finishes **Add to Grok Bot** in the app. Agora does **not** reconstruct a child from a GitHub zip + empty create + pasted skills.
- **B.** **Hybrid.** Prefer template Add; GitHub reconstruct is a fallback if the link is missing or Add fails.
- **C.** Keep ADR 0004: GitHub fetch + CreateAgent (empty/focused Bot + install skills from files). Templates stay v2.
- **D.** Other — describe.

➡️ **Recommend A.** Docs: preconfigured bots on another account are installed by template Add; the app is required to finish; third-party terms attach at Add. GitHub reconstruct is undocumented and is what you flagged as refuse-risk. GitHub `bots/` can still be the **authoring** SoT you publish *from*.

If Q1 is **C**, skip Q2–Q4 and we resume round 1. If **A** or **B**, skip round 1’s zip/disk/materialize questions; they targeted the reconstruct path.

---

❓ **Q2** - **Who finishes Add**: Official docs do not give a Bot a silent “add this template” API.

- **A.** Agora posts the two (or one) template links, tells the user to Add in the app, **waits** until those Bots exist, then greets and quiets. `need <Name>` is the same: link + wait + return id.
- **B.** Agora may try to add the template itself if the platform allows; if not, fall back to A. Do not invent a UI scrape as the happy path.
- **C.** Other.

➡️ **Recommend A.** Match the documented recipient flow. Don’t build first-run on an undocumented self-Add.

---

❓ **Q3** - **What `fetch-blueprint` is**: If install is a template URL, the GitHub zip skill is the wrong contract.

- **A.** Rename the job: resolve `<Name>` → canonical public template URL (and id) stored in this repo. No GitHub archive at runtime.
- **B.** Keep the name `fetch-blueprint` but it only returns that URL (plus maybe a pinned template version/date).
- **C.** Drop a separate skill; put the URL table inside `first-run` and `need-bot`.
- **D.** Still fetch GitHub files at runtime as well as the template URL (only makes sense if Q1 is B).

➡️ **Recommend A or B** (same behavior, your naming). **C** is fine if the table is tiny. **D** only with hybrid.

---

❓ **Q4** - **Child templates in v1**: ADR 0004 deferred “independent public templates per child” to v2. Template-Add install **requires** those links before first-run/`need` can work.

- **A.** Pull child templates into v1. Do not author Agora’s create skills until each bot those skills can install has a **real** `https://x.ai/bot/{id}` (Mneme at least; Euodia too if first-run still creates both).
- **B.** Author the skills now with **placeholder** URLs; publish templates later; first-run no-ops missing links.
- **C.** Publish **Mneme** first (blueprint exists); first-run installs Mneme via template; Euodia waits on its grill+template (would reopen ADR 0003 if Euodia is no longer created on first-run).
- **D.** Other.

➡️ **Recommend A or C, not B.** Placeholder links teach Agora to send users to nowhere. **C** if you will not ship a stub Euodia template; **A** if foundation stays both bots.

---

Reply with letters for Q1–Q4 (skip 2–4 if Q1 is C). After that: either resume round 1 (reconstruct) or grill URL registry / publish order / greet-while-waiting — still no skill bodies until you confirm or say implement.
