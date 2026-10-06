# 与 Respo 下游统一 JS-FFI 版本

## 实际阻塞

Calcium 的严格依赖解析同时遇到已发布 cumulo-util 0.0.24、ws-edn 0.0.33 的 JS-FFI alpha.11，以及 Respo alpha.7 所需的 alpha.13。依赖标签已发布，只在应用端更新版本无法让整个依赖图请求同一个版本。

本分支从已合并的 cumulo-util 主线准备 0.0.25，固定 JS-FFI 0.2.1-alpha.13，以及已发布的 Calcit/procs 0.29.0-alpha.6。alpha.13 的最低编译器为 alpha.2，故同时升级 CLI 与 JS runtime；Caps 0.1.1、Node.js 24、Yarn 4.18.0 沿用既有工具链。

## 修改与边界

Snapshot、JS 适配器、运行时代码、原测试及其预期保持原样；alpha.6 下 canonical format dry-run 无变化。只更新依赖、模块待发布版本、runtime lock、CI 名称和当前中文开发文档。质量分析的 codeNil、unresolved 已清零，用现有 CLI 将对应定义及聚合预算降到零；typeNotFull=2、unsafeCoerce=1 的真实边界保留。

## 验证

严格 Caps 解析、工具链校验、immutable 安装通过。工具链校验首次因沙箱禁止 Caps 更新缓存说明文件失败，允许正常缓存元数据写入后单独重跑通过；共享模块源码没有改写。

两入口检查、browser 公开定义 8/8、node 公开定义 30/30、原质量门禁通过；两入口 JS 生成、原 lifecycle/storage/回调边界测试、实时调度断言和 Vite 构建通过。使用正式发布的 compiler、runtime 和模块，没有使用未发布的核心候选或本地模块替换。

0.0.25 尚待 PR、精确主线 CI 与发布授权；本记录不表示 Calcium 的五组冲突全部消除。ws-edn 和其他旧依赖也需要各自的新版本，以及真实下游严格解析和原测试验收。
