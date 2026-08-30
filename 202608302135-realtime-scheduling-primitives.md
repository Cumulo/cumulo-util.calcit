# Real-time scheduling primitives

- Added `cumulo-util.realtime` as a transport-independent, fully typed state
  layer for retry backoff, heartbeat leases, and dispatch coalescing.
- Public lifecycle operations are trait methods: `.next`, `.reset`, `.renew`,
  `.expired?`, `.request`, `.flush`, and `.cancel`.
- Randomness, wall clock reads, timers, and WebSocket ownership stay with the
  application. The utilities accept numbers and return nominal state, making
  retry and timeout behavior deterministic in tests.
- The coalescer keeps an explicit `:pending?` flag instead of a nullable first
  timestamp. This preserves typed state updates and prevents nominal `Option`
  values from crossing legacy map-association paths.
- Added an executable no-sleep verification script, architecture record, and
  consumer documentation. Synchronized Calcit and `@calcit/procs` to 0.13.66.
