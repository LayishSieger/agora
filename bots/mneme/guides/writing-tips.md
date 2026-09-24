# Master Resume Writing Cheat Sheet

Use this checklist while capturing content. Core rule: **every bullet = strong verb + what you did + quantified result — and every skill is proven inline, never claimed as a bare word.**

This guide is for the **master record** (complete, untrimmed). It is not a tailoring guide. Do not drop bullets, restack order for a posting, or keyword-stuff from a JD. Page limits, ATS overlays, and company-specific versions are Kairos.

## Bullet Formula

```
[Verb] + [specifically what you did] + [the quantifiable result it produced]
```

- ✅ "Rebuilt the checkout API, cutting p95 latency from 1.2s to 380ms and lifting conversion 8%."
- ❌ "Responsible for the checkout API." (a duty, no outcome, no numbers)

Every bullet should ideally answer: **what you did → how you did it → what the result was (ideally with a number).** If there's no number, at least convey "impact/scope."

## Strong Verbs (never start with "Responsible for" / "Worked on")

Built, Led, Shipped, Designed, Launched, Cut, Increased, Reduced, Automated, Scaled, Migrated, Owned, Drove, Negotiated, Mentored, Resolved.

## Where to Find Numbers When the User Can't Recall Any (guide them, but never invent)

- Percentage: how much did it go up/down by?
- Absolute figures: how many users / requests / revenue / lines of code / team size?
- Time: how many hours saved, or how much did the cycle time shrink?
- Scope: how many countries / product lines / how large a scale?

Guide them, but **never invent a number for the user.** If a number really can't be recovered, mark `[to confirm]`, or describe the qualitative impact instead (e.g., "became the team's primary tool").

## Skills Live Inside Bullets, Not in a List

The master resume has no standalone skills section. A claimed skill only belongs in the document if it's written into a specific bullet — naming the tool, method, or feature — with a scannable tag alongside it. This is a deliberate trade: it costs a little more writing than a flat list, but every skill in the document is provably backed by something the person actually did, not just asserted.

**When there's no dramatic business outcome, the tool usage itself is the point of the bullet:**
- ✅ "Optimized inventory tracking in Excel for a 5,000+ SKU catalog using Advanced Conditional Formatting and SUMIFS, saving $15K annually in carrying costs."
- This still follows verb + specifics + result — the "specifics" just carry more weight here, since proving depth with the tool *is* the achievement.

## Tag Format & Naming Rules

Every bullet that demonstrates a skill gets 0-N tags in `[Tag]` format, stored on the bullet’s `tags` list (see `schemas/master-resume.md`). Tags make the master record scannable for **later** bots (Zetesis/Kairos). Mneme must not treat tags as a JD match score.

The naming rule depends on the type of skill. Names should be stable industry terms — not copied from one posting:

| Skill type | Naming rule | Example |
|---|---|---|
| **Hard tools & software** | Tool name + the specific high-value feature(s) used | `[Microsoft Excel (XLOOKUP, PivotTables)]` |
| **Methodologies / frameworks** | The official, recognized industry name | `[Agile / Scrum Methodologies]` |
| **Broad soft skills** | The highest-level corporate umbrella term, with a swappable alias | `[Client Relations (Alias: Client Success)]` |
| **Process & strategy** | A standard, widely-searched skill name | `[Process Improvement]` |

**Full examples (bullet + tag together):**

1. **Hard tools & software**
   Bullet: "Built automated financial reporting dashboards in Microsoft Excel using PivotTables and XLOOKUP, reducing monthly variance analysis time by 40%."
   Tag: `[Microsoft Excel (XLOOKUP, PivotTables)]`

2. **Methodologies, frameworks & standards**
   Bullet: "Facilitated daily stand-ups, sprint planning, and retrospectives using Agile/Scrum methodologies, accelerating product delivery cycles by 20%."
   Tag: `[Agile / Scrum Methodologies]`

3. **Broad soft skills & people operations**
   Bullet: "Managed a portfolio of 45+ enterprise accounts, resolving escalated inquiries and conducting quarterly reviews that drove a 92% client retention rate."
   Tag: `[Client Relations (Alias: Client Success)]`

4. **Process & strategy skills**
   Bullet: "Streamlined legacy onboarding procedures by introducing digital intake forms and standardized tracking templates, cutting turnaround time from 5 days to 24 hours."
   Tag: `[Process Improvement]`

5. **Certifications** (tagged the same way — a cert is evidence too, and should scan consistently with everything else)
   Entry: "AWS Certified Solutions Architect – Associate | Amazon Web Services (Issued: May 2026)"
   Tag: `[AWS / Cloud Architecture]`

6. **Coursework / capstone (degree skill never used on the job)**
   Bullet: "Built a full-stack relational database management application using Python and PostgreSQL, applying Normalization (3NF) and complex SQL JOINs to manage 50,000+ mock user records."
   Tag: `[PostgreSQL (Normalization, SQL Joins)]`

**When to ask the user for the tag vs. just deciding it yourself:** for standard, well-known skills, name the tag yourself using the rules above — don't ask the user to weigh in on something like "Excel" or "Agile." Only ask when the skill is unusual, ambiguous, niche, or could plausibly go by more than one name — e.g., "What would you call this skill — any other name it might go by?" Never ask ChatGPT-style “what does this JD call it?”

## Variants vs tailoring

`variants` = same facts, different wording (e.g. shorter vs more technical). Not a per-job fork. No `audience`, `company`, or `jd` keys.

## Structure and Length

- **Reverse-chronological**: most recent experience/education first.
- No page limit in the master resume — completeness matters more than brevity here (page-length rules apply later, at Kairos, not here).
- **Tense**: present tense for current role, past tense for previous roles.
- **Drop first-person**: bullets shouldn't use "I / My."

## Common Mistakes Checklist (go through this item by item when diagnosing)

- [ ] Bullet is a pile of duties rather than achievements
- [ ] Missing quantified numbers
- [ ] Starts with a weak verb
- [ ] A skill is claimed as a bare word or list item instead of being written into a specific, tagged bullet
- [ ] Tag is missing from a bullet that clearly demonstrates a tool, method, or skill
- [ ] Tag uses an inconsistent or overly generic name (fix using the naming table above)
- [ ] Tag or bullet rewritten to match a pasted JD
- [ ] Unexplained gaps in the timeline (ask; do not invent jobs)
- [ ] Inconsistent formatting (date format, punctuation)
- [ ] Typos / mixed tenses
- [ ] Contact, objective, or target role leaked into the master resume
