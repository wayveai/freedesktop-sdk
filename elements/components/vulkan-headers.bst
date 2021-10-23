kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.2.182.0-0-g37164a5726f7e6113810f9557903a117498421cf
  track: main
  track-extra:
  - sdk-1.2.182
  match:
  - sdk-*
