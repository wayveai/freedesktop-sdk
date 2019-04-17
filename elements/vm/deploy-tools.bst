kind: stack
description: Deployment tooling

depends:
- components/e2fsprogs.bst
- vm/deploy-tools/dosfstools.bst
- vm/deploy-tools/mtools.bst
- vm/deploy-tools/parted.bst
- vm/bsp-generic/syslinux.bst
