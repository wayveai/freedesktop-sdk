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

config:
  install-commands:
    (>):
    - |
      ln -s iHD_drv_video.so %{install-root}%{libdir}/dri/intel-vaapi-driver/iris_drv_video.so

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
