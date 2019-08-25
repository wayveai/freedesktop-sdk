kind: filter

depends:
- filename: components/llvm-base.bst
  type: build
- filename: components/llvm-runtime.bst
  type: runtime

config:
  include:
  - static
  include-orphans: False
