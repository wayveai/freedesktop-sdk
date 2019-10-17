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
  ref: libevdev-1.8.0-0-g779749b22c0dd62cadf9e147c97c5a7675a92478
