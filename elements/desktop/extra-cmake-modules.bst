kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DENABLE_TESTING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib

sources:
- kind: tar
  url: https://download.kde.org/stable/frameworks/5.48/extra-cmake-modules-5.48.0.tar.xz
  ref: fc5b7a9dedb4f6a91db17482578c33f1ec55f11791c592ee431f6d9898ede598
