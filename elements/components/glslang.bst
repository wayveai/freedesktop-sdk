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
  ref: 11.2.0-0-g5421877c380d5f92c1965c7a94620dac861297dd
