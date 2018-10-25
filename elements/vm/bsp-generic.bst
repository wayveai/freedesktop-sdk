kind: stack
description: |
  Linux kernel and any platform specific components required for booting.

depends:
- vm/bsp-generic/linux.bst

(?):
- target_arch in ["i686", "x86_64"]:
    depends:
      (>):
      - vm/bsp-generic/syslinux.bst
