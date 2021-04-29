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
  ref: 1.7.0-0-g999f4ae4659a04c7eb8615ae5ae20b21f6a63d0b
