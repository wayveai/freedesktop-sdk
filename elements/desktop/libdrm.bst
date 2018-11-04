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
- kind: git_tag
  url: freedesktop:mesa/drm.git
  track: master
  ref: libdrm-2.4.94-0-g8389c5454804d5cd7f62f1cadb841fb1b8a51817
