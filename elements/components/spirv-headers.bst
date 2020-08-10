kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers.git
  # There is no release that can build released tools. So we do not track
  # releases. Tracking is disabled to not warn us for every commit in
  # master.
  #track: master
  #track-tags: false
  ref: 1.5.3-18-g3fdabd0da2932c276b25b9b4a988ba134eba1aa6
