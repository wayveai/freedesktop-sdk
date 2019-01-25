kind: stack
description: Deployment tooling

depends:
- base/e2fsprogs.bst
- base/tzdata.bst
- desktop/systemd-base.bst
- vm/deploy-tools/dosfstools.bst
- vm/deploy-tools/mtools.bst
- vm/deploy-tools/parted.bst
- vm/bsp-generic/syslinux.bst
