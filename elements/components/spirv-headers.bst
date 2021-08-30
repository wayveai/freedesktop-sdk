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
  # See DEPS file in SPIRV-tools repo to know exactly what version to use
  track: master
  track-tags: false
  ref: e71feddb3f17c5586ff7f4cfb5ed1258b800574b
