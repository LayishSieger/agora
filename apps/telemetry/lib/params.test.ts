import assert from "node:assert/strict";
import { describe, it } from "node:test";
import {
  eventPath,
  parseAgoraFlag,
  parseInstallEventName,
  parseInstallId,
  parseRelease,
  parseRosterBot,
  registryPath,
} from "./params.ts";

describe("parseInstallId", () => {
  it("accepts a UUID and lowercases it", () => {
    const id = parseInstallId("550E8400-E29B-41D4-A716-446655440000");
    assert.equal(id, "550e8400-e29b-41d4-a716-446655440000");
  });
  it("rejects empty, path, and non-uuid", () => {
    assert.equal(parseInstallId(""), null);
    assert.equal(parseInstallId("../x"), null);
    assert.equal(parseInstallId("not-a-uuid"), null);
    assert.equal(parseInstallId(null), null);
  });
});

describe("parseRosterBot", () => {
  it("canonicalizes Latin names", () => {
    assert.equal(parseRosterBot("mneme"), "Mneme");
    assert.equal(parseRosterBot("EUODIA"), "Euodia");
  });
  it("rejects Agora and aliases", () => {
    assert.equal(parseRosterBot("Agora"), null);
    assert.equal(parseRosterBot("Career Curator"), null);
  });
});

describe("parseRelease", () => {
  it("accepts a tag", () => {
    assert.equal(parseRelease("v1.2.0"), "v1.2.0");
  });
  it("rejects empty and path-like", () => {
    assert.equal(parseRelease(""), null);
    assert.equal(parseRelease("a/b"), null);
    assert.equal(parseRelease("v 1"), null);
  });
});

describe("flags", () => {
  it("requires agora=1 and event=install", () => {
    assert.equal(parseAgoraFlag("1"), true);
    assert.equal(parseAgoraFlag("true"), false);
    assert.equal(parseInstallEventName("install"), true);
    assert.equal(parseInstallEventName("register"), false);
  });
});

describe("blob paths", () => {
  it("scopes by install id", () => {
    const id = "550e8400-e29b-41d4-a716-446655440000";
    assert.equal(registryPath(id), `registry/${id}.json`);
    assert.equal(
      eventPath(id, "2026-09-24T00:00:00.000Z", "n1"),
      `events/${id}/2026-09-24T000000.000Z-n1.json`,
    );
  });
});
