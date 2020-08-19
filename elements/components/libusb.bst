kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst

depends:
- components/systemd-libs.bst

sources:
- kind: git_tag
  url: github:libusb/libusb.git
  track: master
  match:
  - 'v*'
  exclude:
  - '*-rc*'
  ref: v1.0.23-0-ge782eeb2514266f6738e242cdcb18e3ae1ed06fa
