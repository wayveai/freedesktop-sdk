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
  ref: 1.9.0-0-ge1c761a9a03ffe95fbb11367252a0d091ea6a1d5
