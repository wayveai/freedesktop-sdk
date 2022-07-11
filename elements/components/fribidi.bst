kind: meson

depends:
- filename: bootstrap-import.bst


build-depends:
- filename: components/which.bst
- filename: components/pkg-config.bst
- filename: components/libtool.bst
- public-stacks/buildsystem-meson.bst

variables:
  meson-local: >-
    -Ddocs=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfribidi.so'

sources:
- kind: git_tag
  url: github:fribidi/fribidi.git
  track: v1.0.12
  ref: v1.0.12-0-g6428d8469e536bcbb6e12c7b79ba6659371c435a
