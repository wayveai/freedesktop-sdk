kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes

sources:
- kind: git_tag
  url: github:KhronosGroup/glslang.git
  ref: 333d1c95792692205472c457d7bec915a94c8000
# We hardcode known-good commit from vulkan-validation-layers.bst tag
# https://github.com/KhronosGroup/Vulkan-ValidationLayers/blob/sdk-1.1.114.0/scripts/known_good.json#L9
