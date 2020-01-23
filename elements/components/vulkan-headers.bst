kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  track: master
  match:
  - sdk-*
  ref: sdk-1.1.130.0-0-g0e57fc1cfa56a203efe43e4dfb9b3c9e9b105593
