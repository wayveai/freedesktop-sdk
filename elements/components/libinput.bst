kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/doxygen.bst

depends:
- components/jpeg.bst
- components/libpng.bst
- components/systemd.bst
- components/mtdev.bst
- components/libevdev.bst
- components/libwacom.bst

variables:
  meson-local: >-
    -Ddebug-gui=false
    -Ddocumentation=false
    -Dtests=false

sources:
- kind: git_tag
  url: freedesktop:libinput/libinput.git
  track: master
  ref: 1.14.1-0-g7a12e460c07f070cb71e55e875e8156c924a4fd3
