kind: meson
description: libdrm

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/xorg-lib-pciaccess.bst
- components/libdrm.bst

(@):
- elements/extensions/mesa/config.yml

variables:
  meson-local: >-
    -Detnaviv=true
    -Dtegra=true
    -Dudev=false
    -Dlibdrm=false
    -Dlibkms=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdrm_*.so'

sources:
- kind: git_tag
  url: freedesktop:mesa/drm.git
  track: main
  ref: libdrm-2.4.110-0-g56f81e6776c1c100c3f627b2c1feb9dcae2aad3c
- kind: patch
  path: patches/libdrm/libdrm-disable-libdrm.patch
