kind: manual

build-depends:
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/bc.bst

variables:
  (?):
  - target_arch == "x86_64":
      board: qemu-x86_64
  - target_arch == "aarch64":
      board: qemu-arm64
  - target_arch == "riscv64":
      board: qemu-riscv64_smode

config:
  configure-commands:
  - |
    cat <<\EOF >>"configs/qemu-riscv64_smode_defconfig"
    CONFIG_USE_PREBOOT=y
    CONFIG_PREBOOT="setenv fdt_addr ${fdtcontroladdr}; fdt addr ${fdtcontroladdr};"
    EOF

  - make "%{board}_defconfig"

  build-commands:
  - make V=1 all

  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/u-boot/%{board}" u-boot.bin
  - install -Dm755 -t "%{install-root}%{bindir}" tools/mkimage

sources:
- kind: git_tag
  url: https://gitlab.denx.de/u-boot/u-boot.git
  track: master
  exclude:
  - "*-rc*"
  ref: v2021.01-0-gc4fddedc48f336eabc4ce3f74940e6aa372de18c
