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
  - sdk-1.2.135
  match:
  - sdk-*
  ref: sdk-1.2.135.0-0-gfb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90
