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
  url: github:KhronosGroup/glslang
  ref: 7.11.3214-0-gc11e3156af2297f89a23c8db3f5e2323733ee556
  track: master
  exclude:
  - untagged-*
  - master-tot
