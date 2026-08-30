# Real-time scheduling primitives

`cumulo-util.realtime` provides deterministic state transitions for the parts
of a real-time client that should not own a WebSocket, a browser timer, or a
clock. Applications supply `now-ms`, random samples, and timer installation;
the module returns nominal state and an explicit next delay.

## Retry backoff

`retry-backoff` creates immutable state. Call `.next` with a random unit in
`[0, 1]`; its `RetryStep` contains `:delay-ms` and the next state. The input is
clamped, so tests can use stable values such as `0`, `0.5`, and `1` without
mocking global randomness. Call `.reset` after a successful connection.

```cirru.no-check
let
    backoff $ retry-backoff 200 30000 0.2
    step $ backoff.next js/Math.random
  schedule-reconnect! (:delay-ms step) $ :next step
```

## Heartbeat leases

`heartbeat-lease` records the last observed time and an absolute deadline.
Renew it with `.renew`, and let `.expired?` decide whether a server or client
should stop treating a peer as active. The transport remains responsible for
sending and receiving heartbeat messages.

```cirru.no-check
let
    lease $ heartbeat-lease now-ms 15000
    renewed $ lease.renew next-now-ms 15000
  if (renewed.expired? check-now-ms) (mark-idle!) (keep-active!)
```

## Coalescing one timer

`coalescer` merges repeated requests into one externally-owned timer. `.request`
returns a `CoalescedPlan` with bounded `:delay-ms`; its `:state` keeps the first
request timestamp so `max-wait-ms` remains a hard upper bound. `.flush` and
`.cancel` both clear pending state; the application chooses whether to run the
work before clearing its actual timer.

```cirru.no-check
let
    plan $ scheduler.request now-ms
  do
    reset! *scheduler $ :state plan
    reset! *timer $ js/setTimeout (:delay-ms plan) flush!
```

## Browser composition

Use `cumulo-util.activity/watch-page-activity!` for visibility signals and keep
its cleanup function. A browser reconnect controller can call the methods above
from Promise completion and `AbortController` cancellation: abort clears the
installed timeout and applies `.cancel`; a successful open applies `.reset`;
visibility and online events call `.request` or renew a lease. This keeps
protocol messages, revision/ack/resync policy, and socket ownership in
calcium-workflow, ws-edn, or the application.

The verification script uses only supplied numbers and no sleep, so retry,
deadline, and coalescing behaviour stays reproducible in CI.
