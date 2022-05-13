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
  ref: intel-gmmlib-22.1.3-0-g0f0d3bfa0c7101be6b14a733460984da1ede9e5c
