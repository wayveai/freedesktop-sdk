kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/ruby.bst
  type: build

variables:
  conf-local: >-
    --enable-custom-vendordir="%{libdir}/GL/OpenCL/vendors"
    --disable-update-database

  local_flags: -fcommon

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
  ref: v2.2.13-0-g3b7ded60ebb7e1afddcbae6f82ac8645b276e358
