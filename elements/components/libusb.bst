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
  ref: v1.0.25-0-g4622bfcf44db373c53502e3fe873bd611e8332f6
