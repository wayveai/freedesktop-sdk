kind: myautotools
description: util-linux

depends:
  - filename: bootstrap-import.bst
    type: build

variables:
  conf-extra: |
    --disable-wall \
    --disable-makeinstall-chown \
    --disable-kill

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libfdisk.so"
        - "%{libdir}/libblkid.so"
        - "%{libdir}/libsmartcols.so"
        - "%{libdir}/libmount.so"

sources:
  - kind: tar
    url: https://www.kernel.org/pub/linux/utils/util-linux/v2.31/util-linux-2.31.tar.xz
    ref: f9be7cdcf4fc5c5064a226599acdda6bdf3d86c640152ba01ea642d91108dc8a
