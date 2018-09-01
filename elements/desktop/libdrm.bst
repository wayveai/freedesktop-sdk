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
    url: https://dri.freedesktop.org/libdrm/libdrm-2.4.94.tar.bz2
    ref: b73c59b0a3760502c428ba81de49cd4807657d26be5e697eba3a87dd021d16be
