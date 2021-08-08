kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/brotli.bst
- components/libpng.bst

variables:
  meson-local: >-
    -Dbrotli=enabled
    -Dbzip2=enabled
    -Dharfbuzz=disabled
    -Dpng=enabled
    -Dzlib=enabled

(@):
- elements/include/freetype.yml
