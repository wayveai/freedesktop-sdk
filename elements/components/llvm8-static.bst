kind: filter

depends:
- filename: components/llvm8-base.bst
  type: build
- filename: components/llvm8-runtime.bst
  type: runtime

config:
  include:
  - static
  include-orphans: False
