kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers
  track: master
  match:
  - sdk-*
  ref: sdk-1.1.121.0-0-g5671d014bc1792a116d374792f8a6cfba2e6f512
