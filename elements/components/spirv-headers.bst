kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers.git
  ref: 1.5.3-0-gc0df742ec0b8178ad58c68cff3437ad4b6a06e26
