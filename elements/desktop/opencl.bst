kind: autotools

depends:
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/ruby.bst
  type: build

variables:
  conf-local: |
    --enable-custom-vendordir \
    --disable-update-database

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{indep-libdir}/GL/OpenCL/vendors"

    - |
      mkdir -p "%{install-root}%{sysconfdir}"

    - |
      ln -s "$(realpath -m --relative-to="%{sysconfdir}" "%{indep-libdir}/GL/OpenCL")" "%{install-root}%{sysconfdir}/OpenCL"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libOpenCL.so'

sources:
- kind: tar
  url: https://github.com/OCL-dev/ocl-icd/archive/v2.2.12.tar.gz
  ref: 17500e5788304eef5b52dbe784cec197bdae64e05eecf38317840d2d05484272
- kind: local
  directory: khronos-headers/CL/
  path: files/opencl/cl.hpp
- kind: local
  directory: khronos-headers/CL/
  path: files/opencl/c12.hpp
