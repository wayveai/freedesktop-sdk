kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/gnu-efi.bst

sources:
- kind: git_tag
  url: github:fwupd/fwupd-efi.git
  track: master
  ref: 1.1-0-gfee1b8f6473cb403b8ae7a56961ba0557e3f3efa
