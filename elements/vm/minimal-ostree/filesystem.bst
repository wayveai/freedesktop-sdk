kind: compose

build-depends:
- vm/minimal-ostree/deps.bst

config:
  exclude:
  - debug
  - devel
  include-orphans: True
