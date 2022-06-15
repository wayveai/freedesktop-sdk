kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.3.216.0-0-g3ef4c97fd6ea001d75a8e9da408ee473c180e456
  track: main
  track-extra:
  - sdk-1.3.216
  match:
  - sdk-*
