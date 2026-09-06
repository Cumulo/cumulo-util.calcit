# Browser touch timer / 浏览器触摸节流定时器

Issue: https://github.com/Cumulo/cumulo-util.calcit/issues/33
Required by calcit-lang/calcit#876 after the Ref-write checker in #880.

Base main 65e76d3 (published 0.0.17). Work is isolated; the original dirty checkout
and other worktrees are untouched. Add exact runtime dependency js-ffi 0.1.12 and
load it only in the default browser entry; the server entry remains unchanged.

watch-browser-lifecycle! now uses the published numeric browser set-timeout!
adapter. Its cooldown callback explicitly returns Unit instead of reset!'s Bool.
No unsafe coercion was added and the 800ms throttle, callback signals and cleanup
semantics are retained. The browser fake-clock test now requires timer callbacks
to return JS undefined (Calcit Unit), in addition to existing signal/cleanup checks.

Validation: caps --strict, Yarn immutable install, yarn test, yarn build, server
check/codegen, dynamic-method limit 0, unchanged quality baseline, canonical
formatting and git diff --check pass. The unreleased core Ref validator passes
both the default entry and isolated watch-browser-lifecycle! preprocessing.

An ignored ws-edn integration snapshot loads this local source with the local
ws-edn nominal/timer fixes. With the unreleased core compiler, page preprocessing,
JS generation and the generation/heartbeat/singleton regression pass. This is
explicitly local source integration, not verification of published dependencies.
Earlier attempts failed on a missing temporary module search path and duplicate
metadata from differently named js-ffi paths; neither failure was accepted as a
build. The successful rerun used consistent module paths and &&-gated checks.

浏览器节流定时器复用已发布的类型化接口；回调明确返回 Unit，既有信号序列、
冷却时间、监听器和定时器清理保持不变。两个模块本地联调通过，但尚未公开提交、
完成 review/Actions 或发版，不以本地源码覆盖替代正式版本依赖验收。
