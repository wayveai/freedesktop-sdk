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
  meson-local: >-
    -Ddriverdir="%{libdir}/dri/intel-vaapi-driver"

  local_flags: -fcommon

sources:
- kind: git_tag
  url: github:intel/intel-vaapi-driver.git
  track: master
  track-extra:
  - v2.4-branch
  ref: 2.4.1-0-g9a1f0c64174f970a26380d4957583c71372fbb7c
