# ADR 0011 — Successful fetch atomically replaces the installed blueprint folder

Overlay would keep files the new Release deleted and could leave a mixed tree if extract died mid-way. Fetch extracts the slug to a temp tree, requires `profile.md`, then swaps over `/workspace/bots/<slug>/` so the live folder matches the shipped snapshot. `RELEASE` is a single-line `tag_name`, written only after that swap. Failure leaves the previous installed blueprint untouched (or absent).
