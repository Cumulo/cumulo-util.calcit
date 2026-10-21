# cumulo-util

Small, protocol-independent helpers shared by Cumulo applications.

## Browser lifecycle

```cirru.no-run
ns app.client $ :require $ cumulo-util.activity :refer (watch-browser-lifecycle!)

defn start-browser-sync! () $ watch-browser-lifecycle!
  fn (signal)
    match signal
      :visible $ println "|Send an active/snapshot request"
      :hidden $ println "|Mark this client idle"
      :online $ println "|Retry only if local retry state permits it"
      :offline $ println "|Pause outbound attempts"
      :touch $ println "|Refresh active client intent"
      :heartbeat $ println "|Refresh the active lease"
      _ $ println "|Unknown browser signal:" signal
  , (Option :some 3000)
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

cumulo-util.activity/watch-page-activity! $ fn $ signal

cumulo-util.core/on-page-touch $ fn $

cumulo-util.core/visibility-heartbeat
  fn () $ println |heartbeat
  Option :some 3000
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

cumulo-util.file/merge-local-edn! base filepath $ Option :some $ fn (found?) (println found?)
```

## 开发与验证

使用者注意：模块 `0.0.31` 配对正式 Calcit / `@calcit/procs` `0.30.1`、Caps `0.1.1`、Node.js 24 和 Yarn `4.18.0`，依赖正式 `calcit-lang/js-ffi` `0.2.5`。下游需要同步完整正式依赖图，不混用旧 alpha 或单独升级其中一端，不关闭 Caps strict；正式模块版本以发布标签为准。本次不改 Calcit Snapshot 或既有 API。
生命周期、存储与调度 API、回调顺序和业务协议不变；Node path/read 返回值复用带运行时检查的正式 JS-FFI 接口，去掉旧 String 类型断言。备份路径仍单次调用原 path.join，结果做实际 String 检查，不改变本地月/日或目录归属。
Yarn 的新包安装隔离期统一为一小时，不再逐版本设置安装豁免；仅影响本仓库，不修改全局配置。

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

验证命令：

```bash
calcit calcit.cirru edit format
git diff --exit-code -- calcit.cirru
calcit calcit.cirru --check-only
calcit calcit.cirru --entry server --check-only
calcit fix --workflow strict --verify
calcit calcit.cirru --check-only --ns cumulo-util.activity --ns cumulo-util.core --ns cumulo-util.client --summary-only
calcit calcit.cirru --entry server --check-only --ns cumulo-util.app --ns cumulo-util.file --ns cumulo-util.realtime --summary-only
calcit calcit.cirru analyze weak-types --only coverage --summary-only
calcit calcit.cirru analyze weak-types --only deprecated-call
calcit docs check-md README.md --dep ./ --failures-only
calcit calcit.cirru js
calcit calcit.cirru --entry server js
yarn build
yarn test
```

浏览器生命周期 helper 使用 js-ffi 的数字 timer 合同，不依赖 Lilac。Node 入口通过同一模块加载 typed Node 文件适配器；它不会执行浏览器 lifecycle helper。两个入口分别验证和生成 JS。

六个项目命名空间按实际 browser/node 目标完整检查；不要在 browser 入口使用
`--all-defs`，它会错误地把 Node 专属文件适配器也交给 browser 目标。

模块和 js-ffi 使用精确正式 tag，不使用 main/hash。下游应在 cumulo-util 新标签发布后，再一起同步请求同一 JS-FFI 版本的依赖图，不能只改根依赖或关闭 strict。

原 CI 复用已发布 WS-EDN `0.0.45` 的真实源码作独立消费者回归：使用本模块已验证的
宿主 manifest、lock、runtime 和隔离模块视图，保留 browser/node 目标、完整 strict、
原 unit 测试及两入口 JS codegen，确认消费者 Snapshot 未改。
这是源码兼容性 fixture，不等于 WS-EDN 自身 npm 发布图、JS 宿主/网络测试或真实
浏览器已验收；更新的 WS-EDN `0.0.46` 属于 0.31 alpha 线，本轮不回退或覆盖它。
候选覆盖的审计支持另见 [Caps #15](https://github.com/calcit-lang/caps/issues/15)。

正式配对已在 [CI](https://github.com/Cumulo/cumulo-util.calcit/actions/runs/39582155836)
完成自身正常 Caps strict 图、不可变 Yarn、完整 strict、原两入口公开检查和原测试/构建。
WS-EDN 源码兼容性回归的 browser 44/44、node 28/28、完整 strict、原 unit 23/23
及两入口 codegen 通过；不将这些结果扩大为其 JS 宿主、网络或应用部署验收。

### 已有接口与边界

browser/node 入口已显式区分；空 `reload!` 返回 Unit，两处 `%none` 改为
`Option :none`。原生命周期测试、实时调度断言、两入口预处理、代码生成、
Vite 构建均保留，没有添加验证脚本、强转或编译器改写规则。

browser 公开定义 8/8、node 公开定义 30/30 均通过。
`merge-local-edn!` 保留开放的 Map 键/值边界，不替应用定义数据模型；读取后必须
解码为 Map。缺失文件原样返回 base，存在时后读数据覆盖同键值；非 Map 数据报错。
第三参数现在是 `Option<Fn(Bool) -> R>`，回调返回值仍忽略；省略或传 `Option :none`
表示无回调，旧裸函数/nil 调用必须迁移。此接口已包含在 `0.0.24` 发布版本中。
原 Node 测试入口同时检查这些存储行为，使用内存 fs fixture，不实际读写文件。
未执行 shell 命令助手或服务入口。本次将退役的 `merge-dynamic` 改为 `merge`，
迁移后原质量预算也通过；随后移除将被 Calcit 退役的 `analyze quality` 和预算文件。
严格检查是正确性门禁，`weak-types` 是覆盖率与旧 API 的诊断视图，不冒充强制预算门禁。
38 个本地定义中 36 个 full、2 个 partial；剩余 partial 是上述开放存储 Map 边界。

Date 取值和命令输出通过正式 0.28 已支持的模块内 JS 适配器表达：
保留本地月/日、单次 `execSync`、默认 Buffer UTF-8 解码及异常对象，不增加
unchecked 强转。适配器的 String schema 是宿主接口声明，不是编译器对 JS 的证明。
历史上曾通过生成代码内存探针检查这些行为；当前原 CI 的持久 fixture 覆盖生命周期、
存储 Map/缺失值/回调及调度原语，不能冒充真实 shell、路径或文件写入的验收。
`get-backup-path!` 仍保留原宿主 `__dirname` 约定，未声称独立 ESM 部署已验收。
这些适配器沿用既有宿主合同，当前升级保持相同调用与求值行为。

独立 ESM 调用 `get-backup-path!` 已实际复现 `__dirname is not defined`，
目录合同另见[issue48](https://github.com/Cumulo/cumulo-util.calcit/issues/48)。这不是
本轮新通过的能力，也不因 strict/codegen 通过就宣称可部署。未执行真实 shell、
文件写入或服务入口。源码中原3处 Struct 构造迁移到直接构造器；原测试流程保留，
没有新增永久验证脚本、类型预算、权限豁免或编译器规则。

## License

MIT
