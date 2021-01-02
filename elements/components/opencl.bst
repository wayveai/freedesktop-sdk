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
  # track: master ABI break
  ref: v2.2.12-0-gaf79aebe4649f30dbd711c1bf6fc661eac6e5f01
