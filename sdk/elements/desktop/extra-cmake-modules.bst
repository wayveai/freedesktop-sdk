kind: cmake

depends:
- filename: base.bst
  type: build

variables:
  cmake-local: |
    -DENABLE_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib

sources:
- kind: tar
  url: https://download.kde.org/stable/frameworks/5.39/extra-cmake-modules-5.39.0.tar.xz
  ref: b80536d7bed8c12fc492857d3d433b3859462402fe231e463efcd3bf44ffbcd1
