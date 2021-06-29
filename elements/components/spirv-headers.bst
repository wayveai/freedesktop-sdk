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
  ref: 1.5.4.raytracing.fixed-45-gf88a1f98fa7a44ccfcf33d810c72b200e7d9a78a
