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
  ref: r52-0-g1e80a47dffbda813604f0913e2ad68c7054c14e4
