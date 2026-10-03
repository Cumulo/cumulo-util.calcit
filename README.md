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
cumulo-util.core/visibility-heartbeat (fn () $ println |heartbeat) $ Option :some 3000
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
cumulo-util.file/merge-local-edn! base filepath
  Option :some $ fn (found?) $ println found?
```

## Development

The migration toolchain is exact Calcit 0.28.0 with
`@calcit/procs` 0.28.0, Caps 0.1.1 (verify via `caps --version`), Node.js 24,
and Yarn 4.18.0. Module version 0.0.23 is unchanged; this migration is not released.

本轮迁移使用精确的 Calcit 0.28.0、`@calcit/procs` 0.28.0、Caps 0.1.1、
Node.js 24 与 Yarn 4.18.0。模块版本 0.0.23 不变，本轮尚未发布。

```bash
corepack enable
corepack prepare yarn@4.18.0 --activate
caps --version # must report caps 0.1.1
caps --strict --ci
yarn install --immutable
caps verify --toolchain
yarn watch-page   # terminal 1
yarn dev          # terminal 2
```

Validation:

```bash
calcit calcit.cirru edit format
git diff --exit-code -- calcit.cirru
calcit calcit.cirru --check-only
calcit calcit.cirru --entry server --check-only
calcit calcit.cirru analyze check-public --ns cumulo-util.activity --ns cumulo-util.core --ns cumulo-util.client --summary-only
calcit calcit.cirru --entry server analyze check-public --ns cumulo-util.app --ns cumulo-util.file --ns cumulo-util.realtime --summary-only
calcit calcit.cirru analyze quality --baseline config/calcit-quality.cirru
calcit calcit.cirru js
calcit calcit.cirru --entry server js
yarn build
yarn test
```

Browser lifecycle helpers use formal `calcit-lang/js-ffi` `0.2.0`
numeric timer contract. Lilac is not required. The Node server entry does not
execute browser lifecycle helpers. It loads the same module to use the typed Node file adapters.

### 0.28 staging 验证

browser/node 入口已显式区分；空 `reload!` 返回 Unit，两处 `%none` 改为
`Option :none`。原生命周期测试、实时调度断言、两入口预处理、代码生成、
Vite 构建和原质量预算已通过，没有添加验证脚本、强转或编译器改写规则。

browser 公开定义 8/8、node 公开定义 30/30 均通过。
`merge-local-edn!` 保留开放的 Map 键/值边界，不替应用定义数据模型；读取后必须
解码为 Map。缺失文件原样返回 base，存在时后读数据覆盖同键值；非 Map 数据报错。
第三参数现在是 `Option<Fn(Bool) -> R>`，回调返回值仍忽略；省略或传 `Option :none`
表示无回调，旧裸函数/nil 调用必须迁移。此接口变化尚未发布。
原 Node 测试入口同时检查这些存储行为，使用内存 fs fixture，不实际读写文件。
未执行 shell 命令助手或服务入口。原质量预算保持，不新增默认数据清报告。

Date 取值和命令输出通过正式 0.28 已支持的模块内 JS 适配器表达：
保留本地月/日、单次 `execSync`、默认 Buffer UTF-8 解码及异常对象，不增加
unchecked 强转。适配器的 String schema 是宿主接口声明，不是编译器对 JS 的证明。
生成代码的内存 fixture 检查了这些行为，没有执行 shell 或文件写入；
`get-backup-path!` 仍保留原宿主 `__dirname` 约定，未声称独立 ESM 部署已验收。
正式 0.28 不提供文档 main 中的 `js-cast`，本迁移不使用未发布能力。

## License

MIT
