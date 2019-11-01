kind: stack
description: Deployment tooling

depends:
- components/e2fsprogs.bst
- components/systemd.bst
- vm/deploy-tools/dosfstools.bst
- vm/deploy-tools/mtools.bst
- components/syslinux.bst
- components/tzdata.bst
- vm/prepare-image.bst
