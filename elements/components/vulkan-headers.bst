kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.3.211.0-0-g76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8
  track: main
  track-extra:
  - sdk-1.3.211
  match:
  - sdk-*
