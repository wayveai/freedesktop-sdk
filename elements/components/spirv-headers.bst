kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers
  # There is no release that can build released tools. So we do not track
  # releases. Tracking is disabled to not warn us for every commit in
  # master.
  #track: master
  #track-tags: false
  ref: 1.4.1-39-g38cafab379e5d16137cb97a485b9385191039b92
