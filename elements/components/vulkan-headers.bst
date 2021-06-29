kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.2.176.0-0-g074fa3055cfee530992bcbfa0fcb23106a82c1ab
  track: master
  track-extra:
  - sdk-1.2.176
  match:
  - sdk-*
