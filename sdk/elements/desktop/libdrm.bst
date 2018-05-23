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
    url: https://dri.freedesktop.org/libdrm/libdrm-2.4.91.tar.bz2
    ref: 634a0ed0cc1eff06f48674b1da81aafa661a9f001e7a4f43dde81076886dc800
