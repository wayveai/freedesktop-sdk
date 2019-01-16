kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes

sources:
- kind: tar
  url: github:KhronosGroup/Vulkan-Headers/archive/v1.1.96.tar.gz
  ref: c20b0a1961430daa446b8074e44feb621635b4f0dbf337253eb1d3d3ce2e21d7
