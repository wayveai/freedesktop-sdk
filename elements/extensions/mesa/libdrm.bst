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
  track: master
  ref: libdrm-2.4.106-0-g77b642b6dea5daac884fac470d0215fac2caf8fc
- kind: patch
  path: patches/libdrm/libdrm_disable_libdrm.patch
