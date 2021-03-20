kind: compose

config:
  exclude:
  - devel
  - extra
  - vm-only

build-depends:
- platform.bst
- components/os-release.bst
- vm/mesa-default.bst
