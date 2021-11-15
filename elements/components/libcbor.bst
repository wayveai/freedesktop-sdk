kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:PJK/libcbor.git
  track: master
  ref: v0.9.0-0-g58b3319b8c3ec15171cb00f01a3a1e9d400899e1
