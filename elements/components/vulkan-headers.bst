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
  url: github:KhronosGroup/Vulkan-Headers
  track: master
  match:
  - sdk-*
  ref: v1.1.108-0-g097a1045098213919fd56442f52c716fc78eeb27
