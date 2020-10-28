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
  ref: libevdev-1.10.0-0-ge6f3141eb626f703796bd537469221c8261489b5
