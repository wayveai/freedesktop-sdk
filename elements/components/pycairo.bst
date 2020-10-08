kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/pkg-config.bst

depends:
- components/cairo.bst
- components/python3.bst

sources:
- kind: git_tag
  url: github:pygobject/pycairo.git
  track: master
  ref: v1.20.0-0-g4783b7eae1fe4eaf2c6b5c950b0c2ea3d25c5f98
