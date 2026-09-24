# Grill round 1 — Author Agora steward skills

Topic: author `first-run.md`, `need-bot.md`, and `fetch-blueprint.md` so the thin public Agora template can run the career-fleet lifecycle.

**Already settled (do not re-litigate unless you contradict):**

- Agora is the only CreateAgent. First-run creates Euodia + Mneme, greets once, then quiets. Later bots are lazy via `need <Name>` (ADR 0002, 0003).
- Blueprints live in this repo as `bots/<name>/profile.md` + skills; public template stays thin (ADR 0004).
- Mneme one-job grill is on main (PR #1). Euodia is still a stub. Plan Next: Agora skills, then Euodia blueprint.
- Telemetry *hosting* and public template *publish* are later. They are in this round only if they change what the three skill files must say.

Skill bodies are **not** written until this grill is settled or you say proceed.

---

❓ **Q1** - **Fetch locator**: `fetch-blueprint` has to pull files from `layishsieger/agora` over HTTPS. ADR 0004 says “tagged release zip or equivalent.” What is the v1 contract?

- **A.** Latest GitHub Release zip (`releases/latest/download/…` or the generated `refs/tags/<tag>.zip`).
- **B.** A tag pin written into the skill (e.g. always `v0.1.0` until Agora’s template is republished).
- **C.** Raw GitHub (or `codeload`) at a moving ref (`main`).
- **D.** Something else (say the exact URL shape).

➡️ **Recommend B if a published Agora template must stay bit-stable with the blueprints it was tested against; A if you want every installer to pick up blueprint fixes without republishing Agora.** Do not pick C unless you accept `main` breaking existing installs.

---

❓ **Q2** - **Blueprint package**: Mneme’s skill files reference `prompts/`, `guides/`, and `schemas/` beside them. ADR 0004’s layout diagram only names `profile.md` and `skills/*.md`. What does a successful fetch include?

- **A.** Entire `bots/<name>/` tree (profile, skills, prompts, guides, schemas, README).
- **B.** Only `profile.md` + `skills/*.md` (prompts/guides/schemas must be inlined into skills later).
- **C.** Profile + skills + any relative paths those skills mention (computed set).

➡️ **Recommend A.** Relative includes already exist on Mneme; inlining would fight the blueprint layout. Grok Bots share one computer, so the tree can live on disk even if only `skills/*.md` become Grok skills.

---

❓ **Q3** - **Where fetched files land**: After fetch, where should Agora write the blueprint so CreateAgent and the child bot can use it?

- **A.** `/workspace/agora/blueprints/<name>/` (installer-owned, next to live career files).
- **B.** `/workspace/blueprints/<name>/` (not under the career SoT dir).
- **C.** Ephemeral temp dir, discarded after CreateAgent (child keeps only Grok profile + skills).
- **D.** Other path.

➡️ **Recommend B.** Keep `/workspace/agora/` for Mneme/Kairos career SoT (ADR 0005). Children still need the prompt/schema files on the shared computer unless you chose Q2-B.

---

❓ **Q4** - **Materialize skills on the child**: Official Grok Bot docs: private skills are one account library; they can be enabled per Bot. CreateAgent is Agora’s name for “create a focused Bot.” After fetch, how does v1 attach the blueprint?

- **A.** Create Bot with `profile.md` as description; save each `skills/*.md` as a private skill; enable those skills on that Bot; leave prompts/guides/schemas on disk (Q3).
- **B.** Stuff everything into the Bot description only (no Grok skills).
- **C.** Files on disk only; tell the child to read them; do not save Grok skills.
- **D.** Other.

➡️ **Recommend A.** Matches Grok’s skill model and Mneme’s existing skill files. B will blow past description size. C makes `/` skills invisible.

---

❓ **Q5** - **Euodia is still a stub**: First-run is defined as CreateAgent Euodia + Mneme. Euodia has no grilled `profile.md` or skills yet; Mneme does.

- **A.** first-run still creates both; Euodia ships as the current stub until its grill.
- **B.** first-run v1 creates **Mneme only**; add Euodia to first-run when its blueprint exists (this would reopen ADR 0003).
- **C.** Block authoring first-run until Euodia is grilled (Agora skills wait).
- **D.** first-run creates Mneme now and writes a placeholder Euodia skill that only says “not ready.”

➡️ **Recommend A only if a stub Euodia is acceptable in a real install; otherwise C** so the thin template never creates a no-job Bot. Do not silently pick B without treating it as an ADR 0003 change.

---

❓ **Q6** - **When first-run runs**: On a new Agora install, what triggers foundation create?

- **A.** Agora’s first user message (any content) — if foundation bots are missing, run first-run before doing anything else.
- **B.** Only an explicit user phrase (`start`, `setup`, `first run`).
- **C.** A Grok routine/on-install hook if the template can ship one; else fall back to A.
- **D.** Other.

➡️ **Recommend A** (with C if the template host actually has an install hook). Users who add a thin template will just say hello.

---

❓ **Q7** - **Idempotency**: User re-opens Agora, or first-run is retried after a partial failure. Euodia and/or Mneme may already exist (by name).

- **A.** If a roster name already exists, skip CreateAgent for that name; still greet if this session hasn’t greeted.
- **B.** Always CreateAgent (duplicates allowed).
- **C.** Treat existing same-name bots as “upgrade”: fetch latest blueprint and overwrite description/skills.
- **D.** Ask the user before creating or skipping.

➡️ **Recommend A for v1.** Profile already says repair/upgrade is Agora’s job, but that can be a later skill. D chatters. B violates one-fleet-per-install.

---

❓ **Q8** - **Legal `need <Name>` set**: Who may be created on `need`, and what names count?

- **A.** Closed roster only: Euodia, Mneme, Zetesis, Hermeneia, Kairos, Melete, Peitho (exact Latin spellings). Unknown name → refuse, list legal names. `need` for an already-present name → return existing id, no second create.
- **B.** Same roster, also accept Greek names and English titles as aliases (`Μνήμη`, `Career Curator` → Mneme).
- **C.** Any name the user/stage asks for (reopens ADR 0001).
- **D.** Execution bots only (Zetesis–Peitho); refuse `need Euodia` / `need Mneme` because first-run owns those.

➡️ **Recommend A+D hybrid: closed roster A, and `need` of a foundation bot that already exists is return-id; `need` of a missing foundation bot is allowed as repair.** Reject C.

---

❓ **Q9** - **Quiet after the one greeting**: Agora greets once, points at Euodia or Mneme, then stays quiet unless asked or `need`. What should “quiet” do with a career question in Agora chat (`tailor this JD`, `who am I`)?

- **A.** One-line refuse + point at the right stage (or `need <Name>` if missing). No career work in Agora.
- **B.** Answer the career question anyway (breaks one-job).
- **C.** Literal silence (no reply).
- **D.** Other.

➡️ **Recommend A.** C looks broken. B is Mneme/Kairos work.

---

❓ **Q10** - **Greeting pointer**: The one greeting must “point to Euodia or Mneme.” How does Agora choose?

- **A.** Always mention both: Euodia if direction is unclear, Mneme to record career truth; never gate Mneme on Euodia (ADR 0003).
- **B.** Ask one question (“do you know your direction?”) then point at one bot.
- **C.** Always point only at Mneme; mention Euodia only if they ask.
- **D.** Other copy — paste it.

➡️ **Recommend A.** Matches “Euodia optional to use; Mneme always present.”

---

❓ **Q11** - **Telemetry sentence in v1 skills**: Hosting `/t` is later. Should `need-bot` / `first-run` still include the fire-and-forget install event?

- **A.** Omit the HTTP step until `/t` exists (ADR 0004 stays; skills get a later patch).
- **B.** Include the step with a placeholder URL / “do not block on failure,” even if it 404s.
- **C.** Include the step but no-op unless an env/URL is set.

➡️ **Recommend C** if you can name the env var now; else **A**. Do not ship B against a dead URL.

---

❓ **Q12** - **Repair/upgrade in these three files**: Agora’s one-job includes configure, repair, and upgrade. For this authoring pass:

- **A.** These three skills cover create + fetch + need + first-run only. Repair/upgrade is a later skill.
- **B.** `need-bot` / `fetch-blueprint` also refresh skills on an existing Bot when the user says upgrade, or when fetch tag changes.
- **C.** Other.

➡️ **Recommend A** so this grill can finish; Q7-C can wait.

---

Reply with the letter (and any override text) for Q1–Q12. After that, the next round will only ask what those answers unblock (release artifact name, zip root layout, greet copy, URL, etc.). No skill bodies until you confirm shared understanding or say to implement.
