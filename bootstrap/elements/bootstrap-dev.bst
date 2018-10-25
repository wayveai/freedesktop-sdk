kind: compose

config:
  include:
  - devel
  include-orphans: false

depends:
- filename: bootstrap.bst
  type: build
