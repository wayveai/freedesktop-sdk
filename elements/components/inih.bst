kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Ddistro_install=true

sources:
- kind: git_tag
  url: github:benhoyt/inih.git
  track: master
  ref: r55-0-gf7f69c6cff2681d84bae371130b4a018cb2171e6
