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
  - sdk-1.2.131
  match:
  - sdk-*
  ref: sdk-1.2.131.1-0-gadf8cf70b2ab352eb8c3ca88b26424051a1ff21f
