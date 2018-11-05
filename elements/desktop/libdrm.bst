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
  ref: libdrm-2.4.96-0-g5a3bdc7add2f30f7673052376514c91dbcd1b64a
