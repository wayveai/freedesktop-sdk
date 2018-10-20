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
- kind: git
  url: https://github.com/libjpeg-turbo/libjpeg-turbo.git
  ref: 574f3a772c96dc9db2c98ef24706feb3f6dbda9a #  2.0.0
