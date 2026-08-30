# Unified browser lifecycle

- Added `cumulo-util.activity/watch-browser-lifecycle!` as the single owner of
  browser visibility, online/offline hints, focus/resume touch throttling, and
  visible-page heartbeat listeners.
- The callback receives `:visible`, `:hidden`, `:online`, `:offline`, `:touch`,
  and `:heartbeat`; startup emits visibility and the local online hint.
- Its returned cleanup removes all four event listeners and clears both the
  heartbeat interval and pending touch cooldown. It deliberately does not own a
  WebSocket, retry policy, or server-health decision.
- Kept `watch-page-activity!` and `on-page-touch` as compatibility projections so
  older callers now share the same listener and cleanup behavior.
- The new watcher receives a typed `Option<Number>` interval and uses
  `.unwrap-or`; compatibility wrappers convert their legacy optional `nil` with
  `optionally` or `%none` before crossing that typed boundary.
- Added a Calcit architecture plan, browser-mock regression coverage for event
  ordering and cleanup, and documented that `navigator.onLine` is only a local
  hint rather than transport health.
