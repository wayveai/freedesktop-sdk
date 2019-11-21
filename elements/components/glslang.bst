kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes

sources:
- kind: git_tag
  url: github:KhronosGroup/glslang.git
  track: master
  match:
  - '*.*.*'
  ref: 7.12.3352-0-g3aac2d44b20d2fcedfbded41ca3cfa932b90ae6f
