kind: meson
description: libdrm

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: desktop/xorg-lib-pciaccess.bst

variables:
  meson-local: |
    -Detnaviv=true \
    -Dtegra=true \
    -Dudev=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdrm_*.so'
        - '%{libdir}/libdrm.so'
        - '%{libdir}/libkms.so'

sources:
- kind: tar
  url: https://dri.freedesktop.org/libdrm/libdrm-2.4.94.tar.bz2
  ref: b73c59b0a3760502c428ba81de49cd4807657d26be5e697eba3a87dd021d16be
