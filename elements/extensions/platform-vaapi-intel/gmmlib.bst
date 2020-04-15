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
  ref: intel-gmmlib-20.1.1-0-g09324e1fe8129b66bdf6b16ed533d56ce654eaa4
