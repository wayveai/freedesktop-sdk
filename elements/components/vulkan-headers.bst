kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.2.170.0-0-g1d99b835ec3cd5a7fb2f2a2dd9a615ee2d1f0101
  track: master
  track-extra:
  - sdk-1.2.170
  match:
  - sdk-*
