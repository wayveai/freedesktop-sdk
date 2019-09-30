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
- filename: components/util-linux.bst
  type: build
- filename: components/tzdata.bst
  type: build
- filename: vm/bsp-generic.bst
  type: build
- filename: vm/initramfs/initramfs-gz.bst
  type: build
- filename: components/systemd.bst
  type: build
- filename: components/pwquality.bst
  type: build
- filename: vm/linux-vm-boot/shadow.bst
  type: build
- filename: vm/boot-integration.bst
  type: build
- filename: vm/journald-config.bst
  type: build
- filename: vm/systemd-networkd-config.bst
  type: build
- filename: components/sudo.bst
  type: build

config:
  include:
  - runtime
  - locale
  - vm-only
  exclude:
  - devel
