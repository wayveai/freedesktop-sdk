kind: meson

depends:
- filename: components/libdrm.bst
- filename: components/libva.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: extensions/mesa/libdrm.bst
  type: build

environment:
  PKG_CONFIG_PATH: "/usr/lib/%{gcc_triplet}/GL/default/lib/pkgconfig:"

variables:
  meson-local: |
    -Ddriverdir="%{libdir}/dri/intel-vaapi-driver"

sources:
- kind: git_tag
  url: github:intel/intel-vaapi-driver.git
  track: master
  track-extra:
  - v2.4-branch
  ref: 2.4.0-0-gd595d01d6421eae30824538fa6d150701ed077df
