kind: filter

depends:
- filename: components/pipewire-base.bst
  type: build
- filename: components/pipewire.bst
  type: runtime

config:
  include:
  - daemon
  include-orphans: False
