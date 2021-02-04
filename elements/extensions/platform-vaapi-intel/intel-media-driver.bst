kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/libva.bst
- extensions/platform-vaapi-intel/gmmlib.bst

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
  track: master
  track-extra:
  - intel-media-20.3
  match:
  - 'intel-media-*'
  exclude:
  - 'intel-media-*.pre*'
  ref: intel-media-20.3.0-0-g86ec0b6f61862806d8aed1803537728d1dfadf84
