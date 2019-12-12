kind: meson

depends:
- filename: desktop/libdrm.bst
- filename: desktop/libva.bst
- filename: base/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Ddriverdir="%{libdir}/dri/intel-vaapi-driver"

sources:
- kind: git_tag
  url: github:intel/intel-vaapi-driver.git
  track: master
  ref: 2.3.0-0-gce593cf433d62f46a87bec73485ae1c968010ae6
- kind: patch
  path: patches/intel-vaapi-driver/intel-vaapi-driver-check-the-interface-from-libva-first.patch
- kind: patch
  path: patches/intel-vaapi-driver/intel-vaapi-driver-properly-check-if-wayland-can-be-used.patch
- kind: patch
  path: patches/intel-vaapi-driver/intel-vaapi-driver-return-false-instead-of-assertion-failure.patch
