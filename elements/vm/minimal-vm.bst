kind: compose

public:
  bst:
    split-rules:
      docs:
      - '%{datadir}/runtime/docs/**'
      locale:
      - '%{datadir}/runtime/locale/**'

depends:
- filename: vm/base-filesystem.bst
  type: build
- filename: bootstrap-import.bst
  type: build
- filename: base/util-linux.bst
  type: build
- filename: vm/bsp-generic.bst
  type: build
- filename: vm/initramfs/initramfs-gz.bst
  type: build

config:
  include:
  - runtime
