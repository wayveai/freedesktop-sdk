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
  url: tar_https:download.kde.org/stable/frameworks/5.54/extra-cmake-modules-5.54.0.tar.xz
  ref: 91b7a9359f1bfe6f667a5a9c23f6b2178555df26ca2e4dd1bb5c38dc36c77144
