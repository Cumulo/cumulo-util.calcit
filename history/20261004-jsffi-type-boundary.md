# JS-FFI 依赖对齐与实时调度类型边界

## 范围

在已经合并的 Calcit 0.28 迁移之上准备 cumulo-util `0.0.24`，
将 JS-FFI 固定为已发布的 `0.2.1-alpha.11`。此版本与 ws-edn 的迁移分支一致，
用于消除下游严格依赖解析中的版本冲突。当前只是发布准备，没有创建发布标签；
下游不能提前把 `0.0.24` 当成已发布依赖。

## 运行时动态调用

现有实时调度测试原先通过，但实际执行产生 16 条 Struct `assoc` 动态方法警告。
源代码的静态 dynamic-methods 摘要为零，不能作为运行时无警告的证据。

将五个定义中的八处 Struct 更新改为 `struct-with`：
`retry-backoff:next`、`retry-backoff:reset`、`heartbeat-lease:renew`、
`coalescer:request`、`coalescer:flush`。
保留字段、返回 Struct、退避上限、抖动、租约截止时间和合并调度行为。
改动通过 Calcit CLI 事务、dry-run 和 Snapshot revision 前置条件写入。

## 本地验证

依赖使用发布标签对应的 JS-FFI `799e707`，而非本地开发分支。
正式 Calcit / procs `0.28.0`，Node.js 24，Yarn `4.18.0`：

- 两入口严格预处理通过。
- browser 公开定义 8/8、node 公开定义 30/30 通过。
- 原质量预算通过；unsafeCoerce 为 1，预算不变。
- browser / node JavaScript 生成通过。
- 原浏览器生命周期与存储 Map、缺失文件、回调边界测试通过。
- 原实时调度断言通过，执行时不再出现上述动态方法警告。
- Vite 构建通过。

本地使用项目忽略目录中的发布缓存链接，没有改写共享依赖缓存。
远端 CI 还需验证 Caps 的完整下载、严格解析和 toolchain 校验流程；
本地源码门禁通过不能替代该结果。
