# cumulo-util

Small, protocol-independent helpers shared by Cumulo applications.

## Browser lifecycle

```cirru
ns app.client $ :require
  cumulo-util.activity :refer $ watch-browser-lifecycle!

defn start-browser-sync! ()
  watch-browser-lifecycle!
    fn (signal)
      case-default signal (println "|Unknown browser signal:" signal)
        :visible $ println "|Send an active/snapshot request"
        :hidden $ println "|Mark this client idle"
        :online $ println "|Retry only if local retry state permits it"
        :offline $ println "|Pause outbound attempts"
        :touch $ println "|Refresh active client intent"
        :heartbeat $ println "|Refresh the active lease"
    , 3000
```

`watch-browser-lifecycle!` immediately reports visibility and the browser online
hint, reports later transitions and throttled focus/resume touches, and emits
heartbeats only while the document is visible. It returns one cleanup function for
all listeners and timers. The online hint is not socket health. Transport messages,
reconnect policy, revision tracking, and snapshot/diff decisions intentionally stay
in the application.

Compatibility APIs remain available:

```cirru.no-check
cumulo-util.activity/page-visible?
cumulo-util.activity/page-online?
cumulo-util.activity/watch-page-activity! $ fn (signal)
cumulo-util.core/on-page-touch $ fn ()
cumulo-util.core/visibility-heartbeat (fn () $ println |heartbeat) $ %some 3000
```

See [Browser lifecycle design](docs/browser-lifecycle.md) for integration and
server-side policy guidance.

See [Real-time scheduling primitives](docs/realtime-primitives.md) for
deterministic retry backoff, heartbeat leases, and one-timer coalescing state.

See [Durable file storage helpers](docs/file-storage.md) for atomic persistence,
Cirru EDN round-trip checks, and storage-boundary rules.

## Node.js file helpers

```cirru.no-check
cumulo-util.file/sh! |pwd
cumulo-util.file/write-mildly! path content
cumulo-util.file/get-backup-path!
cumulo-util.file/merge-local-edn! base filepath $ fn (found?)
```

## Development

The maintained toolchain is exact Calcit 0.13.77 with
`@calcit/procs` 0.13.77, Caps 0.1.0, Node.js 24, and Yarn 4.12.0. The module
version remains 0.0.16 because this migration does not publish a release.

本仓库使用精确的 Calcit 0.13.77、`@calcit/procs` 0.13.77、Caps 0.1.0、
Node.js 24 与 Yarn 4.12.0。本次仅迁移工具链，不发布模块，版本保持 0.0.16。

```bash
corepack enable
corepack prepare yarn@4.12.0 --activate
caps --strict --ci
caps verify --toolchain
yarn install --immutable
yarn watch-page   # terminal 1
yarn dev          # terminal 2
```

Validation:

```bash
calcit calcit.cirru edit format
git diff --exit-code -- calcit.cirru
calcit calcit.cirru --check-only
calcit calcit.cirru --entry server --check-only
calcit calcit.cirru analyze dynamic-methods --max 0
calcit calcit.cirru analyze quality --baseline config/calcit-quality.cirru
calcit calcit.cirru js
calcit calcit.cirru --entry server js
yarn build
yarn test
```

This module has no Calcit package dependencies; Lilac is not required.

## License

MIT
