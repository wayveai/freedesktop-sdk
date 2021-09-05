kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers.git
  # There is no release that can build released tools. So we do not track
  # releases
  track: master
  track-tags: false
  ref: 1.5.4.raytracing.fixed-100-g6cae8216a6ea19ff3f237af01e54378c1ff81fcd
