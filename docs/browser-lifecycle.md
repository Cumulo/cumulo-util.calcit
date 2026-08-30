# Browser lifecycle signals

`cumulo-util.activity/watch-browser-lifecycle!` centralizes browser lifecycle
signals without coupling an application to a WebSocket protocol. It is the
preferred API for new realtime clients.

## Contract

The callback receives one of six tags:

- `:visible` / `:hidden`: emitted immediately when the watcher starts and whenever
  document visibility changes.
- `:online` / `:offline`: emitted immediately when the watcher starts and whenever
  the browser's connectivity hint changes.
- `:touch`: emitted for focus and visible-page resume, throttled to one signal per
  800 ms.
- `:heartbeat`: emitted at the configured interval only while the page is visible.

The optional heartbeat interval defaults to 3000 ms. The returned zero-argument
function removes every listener and clears both the interval and a pending touch
cooldown. Call it during hot reload or component teardown when the watcher may be
installed more than once.

`page-online?`, `:online`, and `:offline` only expose the browser's local
`navigator.onLine` hint. They do not establish that a WebSocket, server, or route is
reachable. Keep transport health and retry outcomes in the application's own state.

`watch-page-activity!` remains as a compatibility projection: it forwards only
`:visible`, `:hidden`, and `:heartbeat`. `cumulo-util.core/on-page-touch` likewise
remains available for legacy zero-argument callbacks and now uses the same watcher.

## Application boundary

Keep these policies in the application rather than this utility module:

- whether the transport is connected;
- the wire representation of active, idle, and heartbeat messages;
- client revision tracking;
- when a resumed client needs a snapshot instead of accumulated diffs;
- server lease duration, dirty markers, backpressure, and rate limiting.

This boundary lets old applications upgrade the browser behavior by changing one
import while preserving their own protocol. It also lets servers evolve snapshot
and diff policy independently of browser APIs.

## Suggested server policy

Treat `:visible`, `:touch`, and `:heartbeat` as lease-renewal candidates. When the
lease expires or the client reports `:hidden`, mark the client idle and dirty
without computing or sending realtime diffs. On the next `:visible`, compare
revisions and start with a fresh snapshot when the retained diff chain is missing or
too expensive.

The server remains authoritative: heartbeats are hints about activity, not proof
that a connection is healthy or that a client has applied a revision.
