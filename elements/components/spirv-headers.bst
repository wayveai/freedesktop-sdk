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
  ref: 1.5.3-18-g979924c8bc839e4cb1b69d03d48398551f369ce7
