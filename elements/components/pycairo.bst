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
  ref: v1.20.1-0-g320b22711fcc55b0158c156e2aab19a2df0c2898
