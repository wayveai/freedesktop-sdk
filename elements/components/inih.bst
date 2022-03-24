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
  ref: r54-0-g5a31af99c4d20586afe521f8cdf6effc0584ed07
