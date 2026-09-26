# ADR 0012 — Successful fetch atomically replaces the installed blueprint folder

Overlay would keep files the new Release deleted and could leave a mixed tree if extract died mid-way. Fetch extracts the slug to a temp tree, requires `profile.md`, writes `RELEASE` (`tag_name` only) into that temp tree, then swaps over `/workspace/bots/<slug>/` so the live folder matches the shipped snapshot plus `RELEASE`. Failure before the swap leaves the previous installed blueprint untouched (or absent).
