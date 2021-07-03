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
  ref: v1.0.24-0-gc6a35c56016ea2ab2f19115d2ea1e85e0edae155
