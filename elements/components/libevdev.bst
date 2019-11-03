kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: public-stacks/buildsystem-autotools.bst
    type: build
  - filename: components/python3.bst
    type: build

sources:
- kind: git_tag
  url: freedesktop:libevdev/libevdev.git
  track: master
  ref: libevdev-1.7.0-0-g1300c237924e85fb6cb5f078849e2da28f393978
