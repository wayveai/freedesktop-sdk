kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/ruby.bst
  type: build

variables:
  # custom-vendor dir is %{libdir}/OpenCL/vendors so that it works
  # with multiarch.
  conf-local: |
    --enable-custom-vendordir="%{libdir}/OpenCL/vendors" \
    --disable-update-database \
    --with-extra-vendordir="%{libdir}/GL/OpenCL/vendors"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libOpenCL.so'

sources:
- kind: git_tag
  url: github:OCL-dev/ocl-icd.git
  track: v2.2.12
  ref: v2.2.12-0-gaf79aebe4649f30dbd711c1bf6fc661eac6e5f01
- kind: patch
  path: patches/opencl/opencl-extra-vendor-dir.patch
