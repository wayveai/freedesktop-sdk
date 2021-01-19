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
  ref: v2.2.14-0-g109694ef2686fe25538c05f3c856912f8ef571a9
