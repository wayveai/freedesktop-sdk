kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.2.189.0-0-gc5b7a2fa18750e435e91e06a50cdc5451c5b9abd
  track: master
  track-extra:
  - sdk-1.2.189
  match:
  - sdk-*
