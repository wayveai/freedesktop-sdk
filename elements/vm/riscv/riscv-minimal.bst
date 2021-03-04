kind: compose

public:
  bst:
    split-rules:
      docs:
      - '%{datadir}/runtime/docs/**'
      locale:
      - '%{datadir}/runtime/locale/**'

build-depends:
- filename: vm/base-filesystem.bst
- filename: bootstrap-import.bst
- filename: components/util-linux.bst
- filename: components/tzdata.bst
- filename: components/systemd.bst
- filename: components/pwquality.bst
- filename: components/shadow.bst
- filename: components/sudo.bst
- filename: components/tzdata.bst
- filename: components/iproute2.bst
- filename: components/os-release.bst
- filename: vm/config/journald.bst
- filename: vm/config/networkd.bst
- filename: vm/config/resolved.bst
- filename: vm/config/useradd-default.bst
- filename: components/usbutils.bst
- filename: components/hosts.bst
- filename: components/openssh.bst
- filename: components/vim.bst
- filename: components/curl.bst
- filename: components/parted.bst

config:
  include:
  - runtime
  - locale
  - vm-only
  exclude:
  - devel

