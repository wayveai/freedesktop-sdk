kind: filter

build-depends:
- components/pipewire-base.bst

runtime-depends:
- components/pipewire.bst
- components/sbc.bst
- components/bluez.bst
- components/rtkit.bst

config:
  include:
  - daemon
  include-orphans: False
