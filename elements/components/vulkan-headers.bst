kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  track: master
  track-extra:
  - sdk-1.2.148
  match:
  - sdk-*
  ref: sdk-1.2.154.0-0-g7f9879b1b1fab53f719a9ed5e6e29533b10972b2
