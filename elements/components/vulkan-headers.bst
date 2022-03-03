kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.3.204.0-0-g1dace16d8044758d32736eb59802d171970e9448
  track: main
  track-extra:
  - sdk-1.3.204
  match:
  - sdk-*
