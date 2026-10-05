# Jobs list schema — Zetesis

Minimal durable shape for `/workspace/agora/jobs/<search-slug>.md`. Markdown only. **No hunt HTML.**

Zetesis sole-writes. Append across continues. Optional `/workspace/agora/jobs/_index.md` may list searches.

---

## Frontmatter (required)

```yaml
---
search_id: "2026-10-05-search"
updated: "2026-10-05"
prefs_summary: "Staff Platform / Senior Backend; Berlin + remote-EU; hybrid"
status: "hunting"   # hunting | waiting_pick | forwarded | stopped
batch_size: 3
---
```

---

## Body

1. **Query notes** (short) — roles × markets × mode used; walls hit (if any).
2. **Jobs table** — append-only rows:

```markdown
## Jobs

| id | company | role | mode | source | evidence | why-listed | date | batch |
|---|---|---|---|---|---|---|---|---|
| helios-data | Helios Data | Staff Platform Engineer | hybrid Berlin | sim://jobs/helios-platform | seen | Platform IC; Berlin hybrid | 2026-10-05 | 1 |
```

### Column rules

| Column | Rule |
|---|---|
| `id` | Stable slug for pointers (`#helios-data`) |
| `company` / `role` | As seen on posting (or clearly marked inferred) |
| `mode` | location / work mode |
| `source` | URL, path, or sim id — never empty |
| `evidence` | `seen`/`verified` or `inferred`/`directional` |
| `why-listed` | One short line |
| `date` | Date noted |
| `batch` | Batch number (1, 2, …) for continue appends |

**Forbidden columns:** `match_percent`, match %, fit %, Hermeneia score.

---

## Append (continue)

On continue (~3 more):

1. Keep the same file path.
2. Append new rows with the next `batch` number.
3. Do **not** delete or rewrite prior rows.
4. Bump `updated` in frontmatter.

---

## Filename

`YYYY-MM-DD-search.md` or `<slug>-search.md` — one active list per search chain unless the user starts a new search.

---

## Optional index

`_index.md` rows: search_id, path, updated, status, row count. Keep short.
