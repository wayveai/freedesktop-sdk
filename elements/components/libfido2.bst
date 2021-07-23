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
  ref: 1.8.0-0-g091cebe448f366c5efdbcd796d1395d175470552
