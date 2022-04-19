kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers.git
  track: master
  match:
  - sdk-*
  ref: sdk-1.3.211.0-0-g4995a2f2723c401eb0ea3e10c81298906bf1422b
