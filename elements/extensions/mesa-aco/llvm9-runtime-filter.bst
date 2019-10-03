kind: filter

build-depends:
- extensions/mesa/llvm9.bst

config:
  exclude:
  - debug
  - devel
  - doc
  include-orphans: True
