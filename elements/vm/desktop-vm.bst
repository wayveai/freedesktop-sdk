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
- filename: sdk.bst
  type: build
- filename: components/util-linux.bst
  type: build
- filename: components/man-db-generate.bst
  type: build
- filename: integration/split-locales.bst
  type: build
- filename: integration/split-docs.bst
  type: build
- filename: components/tzdata.bst
  type: build
- filename: vm/bsp-generic.bst
  type: build
- filename: vm/initramfs/initramfs-gz.bst
  type: build
- filename: components/systemd.bst
  type: build
- filename: components/xorg-server.bst
  type: build
- filename: components/pipewire-daemon.bst
  type: build
- filename: components/pwquality.bst
  type: build
- filename: vm/linux-vm-boot/shadow.bst
  type: build
- filename: vm/linux-vm-boot/weston.bst
  type: build
- filename: vm/boot-integration.bst
  type: build
- filename: vm/mesa-default.bst
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
