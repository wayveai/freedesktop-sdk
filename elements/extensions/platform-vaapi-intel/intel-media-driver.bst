kind: cmake

depends:
- filename: components/libva.bst
- filename: extensions/platform-vaapi-intel/gmmlib.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

environment:
  PKG_CONFIG_PATH: "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig:"

variables:
  cmake-local: >-
    -DCMAKE_INSTALL_LIBDIR="%{libdir}/dri/intel-vaapi-driver/lib"
    -DLIBVA_DRIVERS_PATH="%{libdir}/dri/intel-vaapi-driver"

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/dri/intel-vaapi-driver/lib/libigfxcmrt.so"
        - "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig"
        - "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig/*"

sources:
- kind: git_tag
  url: github:intel/media-driver.git
  track: intel-media-19.2
  track-extra:
  - master
  match:
  - 'intel-media-*'
  exclude:
  - 'intel-media-*.pre*'
  ref: intel-media-19.2.1-0-g9b648d81fb43f70c49304011371279713cb13ccc
- kind: patch
  path: patches/intel-media-driver/intel-media-driver-bad-werror.patch
