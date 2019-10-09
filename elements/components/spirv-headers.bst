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
  ref: 1.5.1-8-g842ec90674627ed2ffef609e3cd79d1562eded01
