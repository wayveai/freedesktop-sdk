kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes

sources:
- kind: git_tag
  url: github:KhronosGroup/glslang.git
  ref: 7.10.2984-0-g1bc601c674aecc2fee0dee8ff7a118db76b4c439
