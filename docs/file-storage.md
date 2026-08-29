---
title: "Durable file storage helpers"
summary: "Use atomic replacement, backup paths, and Cirru EDN merge helpers at the durable storage boundary of a Calcit server"
scope: "module"
kind: "guide"
category: "ecosystem"
aliases:
  - "storage.cirru"
  - "atomic write"
  - "write-mildly"
  - "backup path"
  - "Cirru EDN storage"
  - "server persistence"
entry_for:
  - "cumulo-util.file/write-mildly!"
  - "cumulo-util.file/get-backup-path!"
  - "cumulo-util.file/merge-local-edn!"
---

# Durable file storage helpers

`cumulo-util.file` contains small server-side helpers for durable text and Cirru EDN storage. They do not define an application's schema, session policy, or migration policy; keep those decisions in the application layer.

## Atomic replacement

Use `write-mildly!` when a complete serialized value is ready. It avoids replacing a file when content is unchanged and uses an atomic replacement strategy, which is appropriate for small snapshot-style files such as `storage.cirru`.

```cirru.no-check
cumulo-util.file/write-mildly! storage-path
  format-cirru-edn durable-db
```

Serialize only durable fields. In realtime applications, remove sessions, WebSocket handles, pending effects, timers, and in-memory diff caches before formatting.

## Backup and loading policy

`get-backup-path!` provides the legacy dated backup-path convention. `merge-local-edn!` is useful when a persisted Cirru EDN map should be merged with a current schema/default map.

Before a Calcit upgrade that changes nominal types or Option boundaries, validate data without writing it:

```cirru.no-check
let
    data $ parse-cirru-edn $ read-file |storage.cirru
    encoded $ format-cirru-edn data
  = data $ parse-cirru-edn encoded
```

This checks serialization semantics, not business compatibility. Also load the old storage into the current application schema and exercise login, update, replay, and persistence paths against a copy.

## Shell helper boundary

`sh!` is synchronous host I/O. Keep it out of updaters and UI rendering. Wrap it in a server capability function, validate arguments, and return structured Result/Option values at application boundaries when failures need handling.
