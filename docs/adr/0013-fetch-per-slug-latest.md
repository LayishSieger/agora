# ADR 0013 — Each fetch resolves latest on its own; mixed tags are allowed

First-run calls blueprint fetch twice (Euodia, then Mneme). Forcing both onto one tag would fail Mneme if `/releases/latest` moved mid-turn, or would pin an in-flight snapshot after we already forbade restore (ADR 0007). Each fetch resolves latest independently. Two installed blueprints on one computer may record different `RELEASE` tags. `FIRST_RUN`’s single `tag=` line is a marker detail at implement, not a shared snapshot.
