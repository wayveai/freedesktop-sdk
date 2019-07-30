kind: compose

depends:
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/python3.bst
  type: build
- filename: components/perl.bst
  type: build

config:
  exclude:
  # Excluded because debug is huge and we don't typically want to
  # debug our compilers
  - debug
