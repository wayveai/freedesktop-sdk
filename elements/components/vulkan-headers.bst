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
  - sdk-1.2.141
  match:
  - sdk-*
  ref: sdk-1.2.141.0-0-g09531f27933bf04bffde9074acb302e026e8f181
