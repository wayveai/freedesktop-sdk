kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

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
  ref: intel-gmmlib-22.0.2-0-g9290546f493656d80a4aa05b63dfeaf9f8527b0a
