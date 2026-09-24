import { head, put } from "@vercel/blob";
import { eventPath, registryPath } from "./params";

function token(): string {
  const t = process.env.BLOB_READ_WRITE_TOKEN;
  if (!t) throw new Error("BLOB_READ_WRITE_TOKEN missing");
  return t;
}

export async function registryExists(id: string): Promise<boolean> {
  try {
    await head(registryPath(id), { token: token() });
    return true;
  } catch {
    return false;
  }
}

/** Idempotent: same id is a no-op if already stored. */
export async function upsertRegistry(id: string, ts: string): Promise<void> {
  if (await registryExists(id)) return;
  try {
    await put(registryPath(id), JSON.stringify({ id, agora: 1, ts }), {
      access: "private",
      addRandomSuffix: false,
      allowOverwrite: false,
      contentType: "application/json",
      token: token(),
    });
  } catch {
    if (!(await registryExists(id))) throw new Error("registry put failed");
  }
}

export async function appendInstallEvent(row: {
  event: "install";
  bot: string;
  release: string;
  agora: 1;
  id: string;
  ts: string;
}): Promise<void> {
  const nonce = crypto.randomUUID().slice(0, 8);
  await put(eventPath(row.id, row.ts, nonce), JSON.stringify(row), {
    access: "private",
    addRandomSuffix: false,
    allowOverwrite: false,
    contentType: "application/json",
    token: token(),
  });
}
