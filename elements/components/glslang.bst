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
  ref: 8.13.3559-0-g8db9eccc0baf30c9d22c496ab28db0fe1e4e97c5
