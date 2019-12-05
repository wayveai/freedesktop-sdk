kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: v1.1.97-0-gc200cb25db0f47364d3318d92c1d8e9dfff2fef1
