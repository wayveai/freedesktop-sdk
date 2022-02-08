kind: meson

build-depends:
- components/doxygen.bst
- components/python3.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Dtests=disabled
    -Ddocumentation=enabled

sources:
- kind: git_tag
  url: freedesktop:libevdev/libevdev.git
  track: master
  exclude:
  - 'libevdev-*.*.9*'
  ref: libevdev-1.12.0-0-g69403a63ed29a1ee62edb8d0885fa770dd9a53cf
