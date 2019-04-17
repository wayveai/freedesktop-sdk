kind: filter

depends:
- filename: components/llvm7-base.bst
  type: build
- filename: components/llvm7-runtime.bst
  type: runtime

config:
  include:
  - static
  include-orphans: False
