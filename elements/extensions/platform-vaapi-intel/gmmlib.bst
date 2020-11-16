kind: cmake

depends:
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: >-
    -DCMAKE_INSTALL_LIBDIR="%{libdir}/dri/intel-vaapi-driver/lib"
    -DRUN_TEST_SUITE:BOOL=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/dri/intel-vaapi-driver/lib/libigdgmm.so"
        - "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig"
        - "%{libdir}/dri/intel-vaapi-driver/lib/pkgconfig/*"

sources:
- kind: git_tag
  url: github:intel/gmmlib.git
  track: master
  match:
  - 'intel-gmmlib-*'
  exclude:
  - 'intel-gmmlib-*.pre*'
  ref: intel-gmmlib-20.3.3-0-g1598c1b46fb911cb9060d1a5380aec1ca1ef2c19
