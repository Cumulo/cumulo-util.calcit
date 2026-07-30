# cumulo-util

Small, protocol-independent helpers shared by Cumulo applications.

## Browser lifecycle

```cirru
ns app.client $ :require
  cumulo-util.activity :refer $ watch-page-activity!

defn start-activity-sync! ()
  watch-page-activity!
    fn (activity)
      case-default activity (println "|Unknown activity:" activity)
        :visible $ println "|Send an active/snapshot request"
        :hidden $ println "|Mark this client idle"
        :heartbeat $ println "|Refresh the active lease"
    , 3000
```

`watch-page-activity!` immediately reports the current visibility, reports later
visibility transitions, and emits heartbeats only while the document is visible.
It returns a cleanup function. Transport messages, reconnect policy, revision
tracking, and snapshot/diff decisions intentionally stay in the application.

Compatibility APIs remain available:

```cirru
cumulo-util.activity/page-visible?
cumulo-util.core/on-page-touch $ fn ()
cumulo-util.core/visibility-heartbeat (fn () $ println |heartbeat) 3000
```

See [Browser lifecycle design](docs/browser-lifecycle.md) for integration and
server-side policy guidance.

## Node.js file helpers

```cirru
cumulo-util.file/sh! |pwd
cumulo-util.file/write-mildly! path content
cumulo-util.file/get-backup-path!
cumulo-util.file/merge-local-edn! base filepath $ fn (found?)
```

## Development

```bash
caps --ci
yarn install
yarn watch-page   # terminal 1
yarn dev          # terminal 2
```

Validation:

```bash
cr analyze check-types
cr --entry server ir
yarn build
```

This module has no Calcit package dependencies; Lilac is not required.

## License

MIT
