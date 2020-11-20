kind: meson
description: libdrm

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/xorg-lib-pciaccess.bst
- filename: components/libdrm.bst

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/default"
  lib: "lib"
  debugdir: "/usr/lib/debug"

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
  ref: libdrm-2.4.103-0-g5dea8f56ee620e9a3ace34a99ebf0175efb57b11
- kind: patch
  path: patches/libdrm/libdrm_disable_libdrm.patch
