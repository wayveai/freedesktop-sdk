kind: autotools
description: libdrm

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-lib-pciaccess.bst

variables:
  conf-local: |
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
    url: https://dri.freedesktop.org/libdrm/libdrm-2.4.89.tar.bz2
    ref: 629f9782aabbb4809166de5f24d26fe0766055255038f16935602d89f136a02e
