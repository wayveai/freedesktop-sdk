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
  meson-local: |
    -Detnaviv=true \
    -Dtegra=true \
    -Dudev=false \
    -Dlibdrm=false \
    -Dlibkms=false \

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdrm_*.so'

sources:
- kind: git_tag
  url: freedesktop:mesa/drm.git
  track: master
  ref: libdrm-2.4.105-0-g6b4e956d299c6ff09a4abf89642ccc1beb455c88
- kind: patch
  path: patches/libdrm/libdrm-disable-libdrm.patch
