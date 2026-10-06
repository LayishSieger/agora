# Query matrix — Zetesis

Disclosed framework. Read when gathering hunt inputs and building search queries. English only. No third-party branding.

Build queries from preferences (or chat wants). Do not invent preferences. Do not write masters.

---

## Inputs (from preferences or chat)

| Field | Use |
|---|---|
| `target_roles` | Role titles / families to search |
| `markets` | Cities, countries, or remote regions |
| `work_mode` | remote / hybrid / onsite filter |
| `must_haves` | Phrases that should appear or be strongly implied |
| `deal_breakers` | Exclude or deprioritize matches |
| `salary_floor` | Soft filter when salary is disclosed; never invent salary |

If a field is missing, ask once or proceed with what you have. Do not invent floors or markets.

---

## Matrix

Cross **roles × markets × mode** into concrete queries. Keep the set small enough to run this turn.

Example (prefs: Staff Platform + Senior Backend; Berlin + remote-EU; hybrid):

| # | Role axis | Market / mode | Must-have cue | Notes |
|---|---|---|---|---|
| 1 | Staff Platform Engineer | Berlin hybrid | platform / reliability | Primary |
| 2 | Staff Platform Engineer | remote-EU | platform | Expand |
| 3 | Senior Backend Engineer | Berlin hybrid | backend | Adjacent title |
| 4 | Senior Backend Engineer | remote-EU | backend | Expand |

Add or drop rows from real prefs. Prefer exact titles first; then close synonyms the user already uses.

---

## Filters

1. **Must-haves** — Prefer openings that clearly support them. Label as directional when the fit is inferred from title/blurb only.
2. **Deal-breakers** — Exclude clear matches (e.g. pure people-management when IC is required). If unsure, list as directional and note the risk in why-listed.
3. **Salary floor** — When a posting discloses compensation below floor, skip or flag honestly. When undisclosed, do not invent a number; you may still list if otherwise fitting.
4. **Work mode** — Prefer stated mode. If unknown, label inferred and say so.

---

## Running the matrix

1. Confirm G1 once for the chain.
2. Build the matrix table (brief; can stay in working notes).
3. For each query: fetch/browse public results (outcome-only).
4. On wall → skip that source (hunt-persona); continue other queries.
5. Collect candidates into a pool (working notes). Present and **durably write** only a **batch of three** (matching/directional). Keep overflow for continue — do not dump the pool into `jobs/`.

---

## Checklist

- [ ] Queries trace to prefs/chat — nothing invented.
- [ ] Roles × markets × mode covered (or gaps named).
- [ ] Deal-breakers applied or flagged.
- [ ] No salary invented.
- [ ] Walls did not produce fabricated hits.
