# Conversational Build — Interview Script

The user has nothing written down yet; help build their master resume through Q&A. **Ask one question at a time**, following up based on the answer. The goal is to fill out `schemas/master-resume.md (story) plus profile.yaml / preferences.yaml` **completely** — there's no page limit, so don't stop at "the highlights." Never fabricate anything.

There is no separate skills step in this interview — every skill gets captured inline, as part of a specific bullet, while covering experience, projects, and education. See `../guides/writing-tips.md` for tag-naming rules.

## Opening

Set expectations up front to lower pressure, and make clear this is a comprehensive record, not a resume draft:
> "Okay, let's build this out properly. I'll ask questions section by section — answer in plain, casual language and I'll handle turning it into structured content. This is going to be your full career record, not a single resume, so we'll capture everything, even things that feel minor — that way you'll have it ready whenever you need to put together a resume for a specific job. Let's start simple — walk me through your work history, starting wherever you'd like."

## Collection Order (work through one section fully before moving to the next)

### 1. Contact Info → `profile.yaml`

- Name, email, city/locations; phone optional
- LinkedIn / GitHub / portfolio links (if they have them)

### 1b. Career targets → `preferences.yaml`

- Optional: role(s) or directions they're generally interested in — not a single fixed headline
- Any must-haves / deal-breakers / markets / work mode if they volunteer them

### 2. Experience (the core section, dig into every role — not just the recent ones)

For each job, ask these three steps in order, **finishing one before moving to the next**:

1. **Basics**: "Which company and role was this, and what were the dates?"
2. **What you did**: "What were your main responsibilities in this role? Tell me everything you can think of — even small things, including specific tools or methods you used, since this is your full record, not a single resume." — Let them describe it casually; you refine it.
3. **Outcome follow-up (key step)**: "What change did this ultimately produce? Any numbers — like a percentage improvement, time saved, or number of users affected?"
   - If they can't give a number, guide them rather than inventing one: "Was this built from scratch? How large a group did it affect? Roughly what scale?" — if still no number, mark `[to confirm]`. **Don't fill it in for them.**

For each item, convert it into a specific, tool-named bullet on the spot (verb-first + what was done, naming the actual tool/method + quantified result), and read it back: "Here's how I'd phrase it — '…' — does that sound right? Are the numbers accurate?" If the user mentions an achievement could be framed differently depending on the audience, capture both phrasings as variants rather than picking just one.

**Tagging**: after drafting each bullet, decide the tag yourself using the naming rules in `../guides/writing-tips.md` — don't ask the user about standard, well-known skills (Excel, SQL, Agile, project management, etc.), since the convention is predictable and asking just adds friction. Only ask the user when a skill is unusual, niche, or could plausibly go by more than one name in job postings: "What would you call this in a job posting — any other name it might go by?"

Once a role is fully captured, ask: "Anything else from this role — even something minor, or a tool you used — before we move to the next one?" Then move to the next role, oldest and newest alike — don't skip older roles just because they feel less relevant.

### 3. Projects

Same three-step approach for every project — side projects, open source, freelance work, coursework projects: what it was, what they did (naming tools/methods), the result/scale/link. Don't filter for "resume-worthiness" — capture it all, and tag each bullet the same way as experience.

### 4. Education

School, degree + major, dates, and any detail (GPA / honors). Then ask specifically: "Any coursework, a capstone, or a thesis project worth writing up? If so, what did you build or work on, and what tools or methods did you use?" — turn the answer into a specific, tagged bullet the same way as experience/projects, rather than a vague line like "relevant coursework included databases."

### 5. Certifications & Additional Sections

Walk through each of these and ask if anything applies: certifications (name, issuer, date — tag each one per the naming rules), awards, languages, publications, volunteer work, speaking engagements. Capture details for whatever applies; skip only what genuinely doesn't exist.

## Wrap-Up

1. Echo back `profile.yaml`, `preferences.yaml`, and `master-resume.md`, **listing every number separately for confirmation**.
2. Write `/workspace/agora/profile.yaml`, `preferences.yaml`, and `master-resume.md`.
3. Tell the user these are the foundation source of truth; Kairos will draw from them for job-specific resumes later.

## Anti-Patterns (don't do these)

- ❌ Asking everything at once ("tell me your name, target role, all your experience, and skills") — too much at once; go back to one question at a time.
- ❌ Making up a number like "improved by 30%" when the user didn't provide one — must be marked `[to confirm]` instead.
- ❌ Dropping the user's casual phrasing verbatim into a bullet — it should be refined into "verb + specifics + result," but always read the refined version back for confirmation.
- ❌ Filtering out older roles, small projects, or minor tools because "a resume wouldn't include this" — this isn't a resume, it's the full record.
- ❌ Adding a skill as a bare word without a bullet behind it, or asking the user to name a tag for something standard and obvious.
