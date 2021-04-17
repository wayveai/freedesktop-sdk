kind: stack

(?):
  - target_arch == "riscv64":
      runtime-depends:
      - vm/minimal/qemu-firmware-riscv64.bst
  - target_arch in ["x86_64", "aarch64"]:
      runtime-depends:
      - vm/minimal/qemu-firmware-u-boot.bst
