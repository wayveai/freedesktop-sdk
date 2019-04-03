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
- filename: base/tzdata.bst
  type: build
- filename: vm/bsp-generic.bst
  type: build
- filename: vm/initramfs/initramfs-gz.bst
  type: build
- filename: desktop/systemd.bst
  type: build
- filename: vm/linux-vm-boot/shadow.bst
  type: build
- filename: vm/systemd-firstboot-integration.bst
  type: build

config:
  include:
  - runtime
  - locale
