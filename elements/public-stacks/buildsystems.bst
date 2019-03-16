kind: compose

depends:
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/buildsystem-cmake.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: base/perl.bst
  type: build
- filename: base/qmake.bst
  type: build

config:
  exclude:
  # Excluded because debug is huge and we don't typically want to
  # debug our compilers
  - debug
