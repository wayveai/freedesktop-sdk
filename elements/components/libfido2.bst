kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/systemd-stage1.bst # Depends on udev

depends:
- components/libcbor.bst

sources:
- kind: git_tag
  url: github:Yubico/libfido2.git
  track: master
  ref: 1.10.0-0-g7c83da50b2462f96891cc04b10ce0d49176f3870
