kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DBUILD_SHARED_LIBS:BOOL=yes

sources:
- kind: git_tag
  url: github:KhronosGroup/glslang.git
  track: master
  match:
  - '*.*.*'
  ref: 11.4.0-0-g18eef33bd7a4bf5ad8c69f99cb72022608cf6e73
