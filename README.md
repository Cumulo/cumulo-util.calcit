# cumulo-util

Small, protocol-independent helpers shared by Cumulo applications.

## 使用者需要注意

候选 `0.0.35` 配对正式 Calcit CLI / `@calcit/procs` `0.32.1` 与已发布 JS-FFI
`0.2.9`。消费者需同步精确版本图并重新生成 JS；新类型标注要求匹配 CLI。
发布状态以实际 Git tag 为准，不以 main/commit 代替正式依赖，不关闭 Caps strict。

官方 format 迁移类型表示，38 个定义的语义 schema 保持。生命周期、重试/心跳/合并
调度、存储 Map 及清理函数合同不变。原 browser/node 分入口检查、完整 strict、
宿主夹具和构建保留，不放宽类型门禁。原工作流仅测试/构建，不部署服务。

`get-backup-path!` 在独立 ESM 下仍依赖未定义的 `__dirname`，其目录归属合同见
[issue48](https://github.com/Cumulo/cumulo-util.calcit/issues/48)。该已知限制尚未修复；
不能把 strict/codegen 通过作为该路径可部署的证据，也不能在迁移中默默改成 cwd。

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

使用 Caps `0.1.1`、Node.js 24、Yarn `4.18.0`，CLI/runtime 与依赖图见开头和
`deps.cirru`。Yarn 的新包安装隔离期保持一小时，不新增逐包豁免。
浏览器生命周期使用 JS FFI 的数字 timer 合同；Node 文件适配器仅在 node 入口检查。
无新增强转、断言、预算、测试框架、编译器规则或验证脚本。

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

CI 复用已发布正式 WS-EDN `0.0.47` 的真实源码作独立消费者回归：使用本模块已验证的
宿主 manifest、lock、runtime 和隔离模块视图，保留 browser/node 目标、完整 strict、
原 unit 测试及两入口 JS codegen。旧消费者先通过官方 format 规范化类型表示，
以规范化后的 Snapshot 为检查基准，后续检查/codegen 不得改动它；67 个定义的
迁移前后语义 schema 已逐项对照保持。仅隔离夹具变换，不修改已发布 tag。
这是源码兼容性 fixture，不等于 WS-EDN 自身 npm 发布图、JS 宿主/网络测试或真实
浏览器已验收。这里检查真实源码与本模块的兼容性，不修改其发布标签、上游仓库源码或独立 npm 图。
候选覆盖的审计支持另见 [Caps #15](https://github.com/calcit-lang/caps/issues/15)。

### 已有接口与边界

browser/node 入口显式区分，原两入口预处理、代码生成、Vite 构建、生命周期清理、
存储 Map/缺失值/回调和调度原语回归保留。当前提交的精确验证范围以 PR 为准，
不把旧版本检查数字当作本次验收。
`merge-local-edn!` 保留开放的 Map 键/值边界，不替应用定义数据模型；读取后必须
解码为 Map。缺失文件原样返回 base，存在时后读数据覆盖同键值；非 Map 数据报错。
第三参数现在是 `Option<Fn(Bool) -> R>`，回调返回值仍忽略；省略或传 `Option :none`
表示无回调，旧裸函数/nil 调用必须迁移。此接口已包含在 `0.0.24` 发布版本中。
原 Node 测试入口同时检查这些存储行为，使用内存 fs fixture，不实际读写文件。
未执行 shell 命令助手或业务服务入口。严格检查是正确性门禁，`weak-types` 提供
覆盖率和旧 API 诊断；不通过预算例外掩盖开放存储 Map 的真实边界。

Date 取值和命令输出通过正式 0.28 已支持的模块内 JS 适配器表达：
保留本地月/日、单次 `execSync`、默认 Buffer UTF-8 解码及异常对象，不增加
unchecked 强转。适配器的 String schema 是宿主接口声明，不是编译器对 JS 的证明。
历史上曾通过生成代码内存探针检查这些行为；当前原 CI 的持久 fixture 覆盖生命周期、
存储 Map/缺失值/回调及调度原语，不能冒充真实 shell、路径或文件写入的验收。
`get-backup-path!` 仍保留原宿主 `__dirname` 约定，未声称独立 ESM 部署已验收。
这些适配器沿用既有宿主合同，当前升级保持相同调用与求值行为。`write-mildly!` 的兼容返回和开放存储Map边界不伪造为已完全闭合类型；本轮精确结果以PR为准，不将历史计数当作本轮验收。

备份路径的独立 ESM 限制见开头 issue48。此迁移不执行真实 shell 或文件写入，
不新增永久脚本、权限豁免或编译器规则；宿主夹具的通过不替代业务部署验收。

## License

MIT
