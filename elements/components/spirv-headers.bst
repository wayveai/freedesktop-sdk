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
  ref: 1.5.4.raytracing.fixed-0-gf027d53ded7e230e008d37c8b47ede7cd308e19d
