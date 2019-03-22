kind: filter

depends:
- filename: desktop/llvm7-base.bst
  type: build
- filename: desktop/llvm7-runtime.bst
  type: runtime

config:
  include:
  - static
  include-orphans: False
