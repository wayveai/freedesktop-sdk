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
  ref: sdk-1.3.204.0-0-gb42ba6d92faf6b4938e6f22ddd186dbdacc98d78
