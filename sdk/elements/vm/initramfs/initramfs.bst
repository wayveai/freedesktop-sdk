kind: compose
description: Initramfs composition

depends:
- filename: vm/base-filesystem.bst
  type: build
- filename: bootstrap-import.bst
  type: build
- filename: base/util-linux.bst
  type: build
- filename: vm/initramfs/initramfs-scripts.bst
  type: build

config:
  include:
  - runtime
