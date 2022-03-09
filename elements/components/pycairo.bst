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
  ref: v1.21.0-0-g7f7869f4139dbcc84a6f688a321516cb25cea1b0
