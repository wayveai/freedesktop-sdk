kind: myautotools
description: libdrm

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-lib-pciaccess.bst

variables:
  conf-extra: |
    --disable-udev

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libdrm_nouveau.so"
          - "%{libdir}/libdrm_radeon.so"
          - "%{libdir}/libdrm_intel.so"
          - "%{libdir}/libdrm_amdgpu.so"
          - "%{libdir}/libdrm.so"
          - "%{libdir}/libkms.so"

sources:
  - kind: tar
    url: https://dri.freedesktop.org/libdrm/libdrm-2.4.85.tar.bz2
    ref: 64e4cd87eaee38ae60b2984ef02b66159b9bdd33030040db2a04339cf15f6173
