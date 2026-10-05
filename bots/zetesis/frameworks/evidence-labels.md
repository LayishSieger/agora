# Evidence labels — Zetesis

Disclosed framework. Read when labeling hunt rows and why-listed notes. English only. No third-party branding.

Never present inferred facts as verified. Never fabricate openings to earn a “seen” label.

---

## Labels

| Label | Meaning | When to use |
|---|---|---|
| **seen** / **verified** | You fetched or were shown the posting (or a faithful paste/fixture) and can point to company, role, and source | Public page / file / sim fixture actually read |
| **inferred** / **directional** | Fit or detail is reasoned from title, blurb, company page, or prefs — not fully confirmed on a full JD | Title looks right but JD body unread; mode guessed; salary unknown |

Use one primary label per row. In why-listed, say what was seen vs guessed.

Aliases allowed in tables: `seen`, `verified`, `inferred`, `directional`. Prefer consistency within one jobs file.

---

## Row rules

Every durable + presented row must include an evidence field. Canonical columns live in [`jobs-list-schema.md`](jobs-list-schema.md). Evidence-relevant minimum:

```markdown
| id | company | role | mode | source | evidence | why-listed | date | batch |
```

- **source** — URL, path, or `sim://…` id. Required.
- **evidence** — one of the labels above. Required.
- **why-listed** — one short line; if directional, say what was inferred.
- **id** / **batch** — required on durable rows (stable pointer slug; continue batch number).

### Forbidden

- Claiming **verified** when you only saw a title card or SERP snippet without the posting.
- Inventing company / role / salary / location to complete a batch.
- Putting Hermeneia **match %** in the row (no fit score on hunt list).

---

## Walls

If a wall blocks fetch: do not invent a verified row. Skip or stop. Tell the user. Labeled fixtures are OK only when the sim/setup provides them as stand-ins — still mark evidence honestly (`seen` for fixtures you actually “read”).

---

## Presentation

When showing the **batch of three**, keep the evidence column visible. User should see at a glance which rows are confirmed openings vs directional leads.
