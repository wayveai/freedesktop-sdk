kind: autotools


build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ruby.bst

depends:
- bootstrap-import.bst

variables:
  conf-local: >-
    --enable-custom-vendordir="%{libdir}/GL/OpenCL/vendors"
    --disable-update-database

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libOpenCL.so'

sources:
- kind: git_tag
  url: github:OCL-dev/ocl-icd.git
  track: master
  ref: v2.3.1-0-g1165deedb2ae741cd76e60986f7c2cb5023059d9
