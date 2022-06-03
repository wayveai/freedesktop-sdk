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
  ref: libdrm-2.4.111-0-gf801b07a60740425604d6563e5dc399375108bc4
- kind: patch
  path: patches/libdrm/libdrm-disable-libdrm.patch
