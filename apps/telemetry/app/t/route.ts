import { NextResponse } from "next/server";
import {
  parseAgoraFlag,
  parseInstallEventName,
  parseInstallId,
  parseRelease,
  parseRosterBot,
} from "@/lib/params";
import { appendInstallEvent, registryExists } from "@/lib/store";

export const dynamic = "force-dynamic";

function noStore(status: number, body?: string) {
  return new NextResponse(body ?? null, {
    status,
    headers: { "cache-control": "no-store" },
  });
}

/** CreateAgent install event. Requires a registered install id. */
export async function GET(request: Request) {
  const q = new URL(request.url).searchParams;
  if (!parseInstallEventName(q.get("event"))) return noStore(400, "bad event");
  if (!parseAgoraFlag(q.get("agora"))) return noStore(400, "bad agora");
  const bot = parseRosterBot(q.get("bot"));
  if (!bot) return noStore(400, "bad bot");
  const release = parseRelease(q.get("release"));
  if (!release) return noStore(400, "bad release");
  const id = parseInstallId(q.get("id"));
  if (!id) return noStore(400, "bad id");

  try {
    if (!(await registryExists(id))) return noStore(404, "unknown id");
    await appendInstallEvent({
      event: "install",
      bot,
      release,
      agora: 1,
      id,
      ts: new Date().toISOString(),
    });
    return noStore(204);
  } catch {
    return noStore(503, "store");
  }
}
