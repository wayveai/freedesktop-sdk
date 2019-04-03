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
  ref: libdrm-2.4.97-0-gb7a7a90336fbb19efb3f91f92b5d964b0dfb7ec2
