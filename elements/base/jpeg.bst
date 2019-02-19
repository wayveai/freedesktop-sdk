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
  cpe:
    product: libjpeg-turbo

sources:
- kind: git
  url: github:libjpeg-turbo/libjpeg-turbo.git
  ref: 2.0.0-3-g2260b66e1671038a362dca4a204c28d72b8f7e4e
- kind: patch
  path: patches/jpeg/no-rpath.patch
