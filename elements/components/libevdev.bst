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
  ref: libevdev-1.9.1-0-gbcb79eed391d06fc4e75a39d19da91b41ff344ea
