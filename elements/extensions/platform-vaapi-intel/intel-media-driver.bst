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
  track: master
  track-extra:
  - intel-media-20.1
  match:
  - 'intel-media-*'
  exclude:
  - 'intel-media-*.pre*'
  ref: intel-media-20.1.1-0-g54492c0d175f298c8a2ef90955febeef30837792
