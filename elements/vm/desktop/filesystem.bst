kind: compose

build-depends:
- vm/desktop/deps.bst

config:
  exclude:
  - debug
  - devel
  include-orphans: True
