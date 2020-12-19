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
  - sdk-1.2.162
  match:
  - sdk-*
  ref: sdk-1.2.162.0-0-g87aaa16d4c8e1ac70f8f04acdcd46eed4bd77209
