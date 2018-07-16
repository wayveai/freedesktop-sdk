kind: autotools
description: libdrm

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/xorg-lib-pciaccess.bst
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
    --enable-etnaviv-experimental-api \
    --enable-tegra-experimental-api \
    --disable-udev

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libdrm_*.so"
          - "%{libdir}/libdrm.so"
          - "%{libdir}/libkms.so"

sources:
  - kind: tar
    url: https://dri.freedesktop.org/libdrm/libdrm-2.4.92.tar.bz2
    ref: e9e48fdb4de139dc4d9880aa1473158a16ff6aff63d14341367bd30a51ff39fa
