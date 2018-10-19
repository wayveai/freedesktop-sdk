kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build
- filename: base/nasm.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_INSTALL_LIBDIR="%{libdir}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libjpeg.so'
        - '%{libdir}/libturbojpeg.so'

sources:
- kind: tar
  url: https://sourceforge.net/projects/libjpeg-turbo/files/2.0.0/libjpeg-turbo-2.0.0.tar.gz
  ref: 778876105d0d316203c928fd2a0374c8c01f755d0a00b12a1c8934aeccff8868
