# Browser lifecycle signals

`cumulo-util.activity/watch-page-activity!` centralizes the browser-specific part of
activity tracking without coupling applications to a WebSocket protocol.

## Contract

The callback receives one of three tags:

- `:visible`: emitted immediately when the watcher starts on a visible page, and
  whenever the page becomes visible.
- `:hidden`: emitted immediately when the watcher starts on a hidden page, and
  whenever the page becomes hidden.
- `:heartbeat`: emitted at the configured interval only while the page is visible.

The optional interval defaults to 3000 ms. The returned zero-argument function
removes the visibility listener and clears the interval. Call it during hot reload
or component teardown when the watcher may be installed more than once.

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

Treat `:visible` and `:heartbeat` as lease renewal. When the lease expires or the
client reports `:hidden`, mark the client idle and dirty without computing or
sending realtime diffs. On the next `:visible`, compare revisions and start with a
fresh snapshot when the retained diff chain is missing or too expensive.

The server remains authoritative: heartbeats are hints about activity, not proof
that a connection is healthy or that a client has applied a revision.
