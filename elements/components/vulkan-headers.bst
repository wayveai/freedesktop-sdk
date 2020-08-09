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
  ref: sdk-1.2.148.0-0-gfc87182aab33a63b43db41d7a424eed27283aebf
