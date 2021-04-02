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
  ref: v2.3.0-0-g59c098b6b1f97a339e3e5308499aee6538ecea40
