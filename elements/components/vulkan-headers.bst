kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers
  track: master
  match:
  - sdk-*
  ref: sdk-1.1.114.0-0-ge3f96a9ccab9397481eb81c4d9bce4ea7590dc33
