# Review follow-up: CI toolchain order

## English

- Install the immutable Yarn graph before `caps verify --toolchain`, because the verifier resolves `@calcit/procs` through `yarn node`.
- Document `caps --version` so the exact Caps 0.1.0 requirement can be checked locally.

## 中文

- 将不可变 Yarn 依赖安装放到 `caps verify --toolchain` 之前，因为验证器通过 `yarn node` 解析 `@calcit/procs`。
- 补充 `caps --version`，让开发者可以在本地确认精确的 Caps 0.1.0 版本。
