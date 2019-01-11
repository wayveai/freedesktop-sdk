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
  url: github:KhronosGroup/glslang/archive/7.10.2984.tar.gz
  ref: d0afe88034577ecf06a825db1a5e8222d949a38d3b19c5ce002b90b66c403f67
