kind: meson

build-depends:
- components/python3.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  # Docs depend on doxygen
  meson-local: >-
    -Dtests=disabled
    -Ddocumentation=disabled

sources:
- kind: git_tag
  url: freedesktop:libevdev/libevdev.git
  track: master
  exclude:
  - 'libevdev-*.*.9*'
  ref: libevdev-1.9.0-0-g468760ba11438734912f793b1de00cb0f243497f
