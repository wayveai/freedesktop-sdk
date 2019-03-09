kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: base/python3.bst
    type: build

sources:
  - kind: git_tag
    url: freedesktop:libevdev/libevdev.git
    ref: libevdev-1.6.0-0-gf293c11fecd2d786f7742cb6768863d498b9d31b
