import { NextResponse } from "next/server";
import { parseAgoraFlag, parseInstallId } from "@/lib/params";
import { upsertRegistry } from "@/lib/store";

export const dynamic = "force-dynamic";

function noStore(status: number, body?: string) {
  return new NextResponse(body ?? null, {
    status,
    headers: { "cache-control": "no-store" },
  });
}

/** Agora registration. Counts are untrusted until rate-limit exists. */
export async function GET(request: Request) {
  const q = new URL(request.url).searchParams;
  if (!parseAgoraFlag(q.get("agora"))) return noStore(400, "bad agora");
  const id = parseInstallId(q.get("id"));
  if (!id) return noStore(400, "bad id");
  try {
    await upsertRegistry(id, new Date().toISOString());
    return noStore(204);
  } catch {
    return noStore(503, "store");
  }
}
