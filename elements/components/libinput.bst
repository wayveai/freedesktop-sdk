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
    -Dzshcompletiondir=no

sources:
- kind: git_tag
  url: freedesktop:libinput/libinput.git
  track: main
  track-extra:
  - 1.20-branch
  exclude:
  - "*.9??"
  ref: 1.20.1-0-g562f7bcee0bf513824d30be31e2a64c40d5f2ee1
