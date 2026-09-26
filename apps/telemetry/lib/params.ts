/** Roster Latin names — install events only. */
export const ROSTER = [
  "Euodia",
  "Mneme",
  "Zetesis",
  "Hermeneia",
  "Kairos",
  "Melete",
  "Peitho",
] as const;

export type RosterName = (typeof ROSTER)[number];

const UUID_RE =
  /^[0-9a-f]{8}-[0-9a-f]{4}-[1-8][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

export function parseInstallId(raw: string | null): string | null {
  if (!raw) return null;
  const id = raw.trim().toLowerCase();
  if (!UUID_RE.test(id)) return null;
  return id;
}

export function parseAgoraFlag(raw: string | null): boolean {
  return raw === "1";
}

export function parseRosterBot(raw: string | null): RosterName | null {
  if (!raw) return null;
  const hit = ROSTER.find((n) => n.toLowerCase() === raw.trim().toLowerCase());
  return hit ?? null;
}

/** Blueprint-release tag_name. Non-empty, no path separators. */
export function parseRelease(raw: string | null): string | null {
  if (!raw) return null;
  const tag = raw.trim();
  if (!tag || tag.length > 128) return null;
  if (/[/\\\s]/.test(tag)) return null;
  return tag;
}

export function parseInstallEventName(raw: string | null): boolean {
  return raw === "install";
}

export function registryPath(id: string): string {
  return `registry/${id}.json`;
}

export function eventPath(id: string, ts: string, nonce: string): string {
  const safeTs = ts.replace(/:/g, "");
  return `events/${id}/${safeTs}-${nonce}.json`;
}
