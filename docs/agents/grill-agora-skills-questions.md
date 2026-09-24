# Grill — Author Agora steward skills

**Settled:** Add Agora only; CreateAgent from **latest GitHub Release**; remember the release; whole `bots/<name>/` tree; first-run behavior later; **don’t write `first-run.md` until Euodia**; don’t write fetch/need until this round is clear.

**Q2 from last round:** CreateAgent from `profile.md` + skills on the bot is OK **if we don’t invent a folder that fights how Grok creates bots.** Official docs only require `/workspace` and “clear project folders.” They do **not** document a CreateAgent folder. This repo’s layout is already `bots/<name>/`.

---

## Round 5 — path, versions, leftover bots

❓ **Q1** - **Folder for the fetched blueprint**

- **A.** `/workspace/bots/<name>/` — same names as this GitHub repo. (What you asked.)
- **B.** Whatever folder CreateAgent/the app already makes for that bot, if any; only if that’s empty/unknown, use A.
- **C.** Something else — paste it.

➡️ **Recommend A**, or **B** if you already know Grok writes a bot folder. Don’t use `/workspace/blueprints/`. Don’t put blueprints under `/workspace/agora/` (that’s career data).

---

❓ **Q2** - **Old versions**

GitHub **Releases already are versions** (`v1.2.0`, `v1.3.0`). You do not have to invent a second version system.

- **A.** One live folder per bot + a small `RELEASE` file (e.g. `v1.2.0`). Need an old snapshot? Fetch **that** Release from GitHub into the same folder. No `v1/` `v2/` subfolders on disk.
- **B.** Keep many copies: `/workspace/bots/<name>/v1.2.0/`, `v1.3.0/`, …
- **C.** No VERSION file; only “latest” on disk, forget what you installed.

➡️ **Recommend A.** B clutters the shared computer. C makes leftover-bot checks impossible.

---

❓ **Q3** - **Child bot already there** (reinstall Agora, didn’t delete Mneme)

Never CreateAgent a second Mneme.

- **A.** If name exists: skip create. If `RELEASE` is missing or older than GitHub latest, **refresh in place** (files + description + skills) to latest.
- **B.** If name exists: skip create **and** skip refresh. Tell them to delete the child if they wanted a clean start.
- **C.** If name exists and stale: skip create, **ask** “upgrade Mneme to v1.3.0?” then refresh only if yes.

➡️ **Recommend A** for quiet steward, or **C** if you don’t want silent overwrites of a bot they still use. Your “check version” note is A or C, not skip-blindly.

---

Q4 (write skills) still waits on Q1–Q3.

Reply like `Q1 A, Q2 A, Q3 A or C`.
