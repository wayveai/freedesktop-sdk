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
  ref: 1.5.1.corrected-7-gdc77030acc9c6fe7ca21fff54c5a9d7b532d7da6
