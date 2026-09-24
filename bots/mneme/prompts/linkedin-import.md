# LinkedIn Import

Goal: turn the user's LinkedIn profile into the three foundation files under `/workspace/agora/`. **Real-world constraint: LinkedIn has a login wall, so directly fetching a public URL often returns a 403 or an empty shell.** So the flow is "try first, gracefully degrade if it fails."

Do not use LinkedIn as a job search (Easy Apply, jobs tab, “open to work” recs). “Open to work” / headline targets map to `preferences.yaml` only.

If they paste a **job** URL or a JD with the LinkedIn, `prompts/out-of-scope.md` for the posting; import only profile evidence.

## Steps

### 1. Try a Direct Fetch First

When the user pastes a `linkedin.com/in/...` **profile** link, try WebFetch once to extract name, experience, education, and skills. Do not fetch `linkedin.com/jobs/...`. If the fetch returns a login wall, empty shell, or someone else’s profile, treat as failure — do not scrape guessed content.

### 2. Degrade Gracefully If That Fails (this is the likely path)

If blocked or the content comes back incomplete, **don't force it** — just give the user two simple options:
> "LinkedIn doesn't let programs read your profile directly (it requires login). Two options — pick one: **(A) Export as PDF (recommended, most complete)**: on your computer, open your LinkedIn profile → click **Resources / More** below your photo → **Save to PDF**, then send me the file and I'll read it directly. **(B) Copy-paste**: just copy the text from your About, Experience, Education, and Skills sections and paste it here."

- If they send a PDF → read it directly.
- If they paste text → parse it directly.

### 3. Parse into the Schema — Pull in Everything

Import **all candidate evidence**. Map:

| LinkedIn | File |
|---|---|
| Name, location, contact, profile URL | `profile.yaml` |
| About, headline, “open to work,” interested titles | `preferences.yaml` (`career_notes`, `target_roles` if clearly wants — confirm before treating headline as a target) |
| Experience, education, projects, certifications, volunteer, publications | `master-resume.md` (tagged bullets) |
| Skills list | Checklist only: fold into bullet tags or ask where used (step 4) |
| Recommendations / endorsements | Not first-person evidence. Ask which facts the user claims |
| Job postings, “similar jobs,” recruiter ads in the PDF | Ignore — not intake |

### 4. Strengthen + Verify

LinkedIn experience descriptions are often paragraph-style and lack numbers. After import:

- Break paragraphs into bullets, rewritten per the "verb + result" formula in `../guides/writing-tips.md`, naming specific tools/methods where LinkedIn's text implies them. Implied **tool names** already in the text are OK; implied **metrics** are not — ask.
- **Tag each bullet** that demonstrates a skill, using the naming rules in `../guides/writing-tips.md`. Decide standard tags yourself; only ask the user when a skill from LinkedIn's "Skills" list is unusual, niche, or ambiguous, or when it isn't clearly backed by any bullet — in which case ask where they used it before adding it. Do not rename tags to match a JD.
- **For any result with no number, mark `[to confirm]` and ask the user**: "This section of your LinkedIn doesn't have a number — roughly how many users did this affect, or by how much did it improve things? It's fine if there isn't one — I just won't include a number."
- Never invent anything that wasn't on LinkedIn and hasn't been confirmed by the user.
- Merge with existing `/workspace/agora/` files if present (union + ask on conflicts). Do not delete prior roles because LinkedIn omitted them.

### 5. Confirm and Close Out

Echo profile + preferences + master-resume (especially numbers). Write the three files under `/workspace/agora/`. Nothing to render — if they want a tailored resume, Agora `need Kairos`. Mneme does not CreateAgent.
