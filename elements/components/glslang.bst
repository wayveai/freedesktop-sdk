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
  - '8.*.*'
  ref: 8.13.3743-0-gbcf6a2430e99e8fc24f9f266e99316905e6d5134
