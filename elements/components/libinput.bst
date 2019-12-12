kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/jpeg.bst
- filename: components/libpng.bst
- filename: components/gtk3.bst
- filename: components/systemd.bst
- filename: components/mtdev.bst
- filename: components/libevdev.bst
- filename: components/libwacom.bst

# documentation depends on doxygen
variables:
  meson-local: |
    -Ddocumentation=false \
    -Dtests=false

sources:
- kind: git_tag
  url: freedesktop:libinput/libinput.git
  track: master
  ref: 1.14.1-0-g7a12e460c07f070cb71e55e875e8156c924a4fd3
