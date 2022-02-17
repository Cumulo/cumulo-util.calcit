
cumulo-util in calcit-js
---

### Usages

notice the dependency:

```bash
yarn add nanoid
```

APIs:

```cirru
cumulo-util.core/on-page-touch $ fn ()
cumulo-util.core/id!
cumulo-util.core/delay! 0.1 $ fn ()
cumulo-util.core/repeat! 0.1 $ fn ()

cumulo-util.file/sh! "|echo demo"
cumulo-util.file/write-mildly! path content
cumulo-util.file/get-backup-path!
cumulo-util.file/merge-local-edn! base filepath $ fn (found?)
```

### License

MIT
