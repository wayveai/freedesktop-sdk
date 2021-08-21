kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/cairo.bst
- filename: components/harfbuzz.bst
- filename: components/fontconfig.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/fribidi.bst
- filename: components/libthai.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpango-1.0.so'
        - '%{libdir}/libpangoft2-1.0.so'
        - '%{libdir}/libpangocairo-1.0.so'

# Those are the defaults which we explicitly match.
variables:
  meson-local: |
    -Dgtk_doc=false \
    -Dintrospection=true \
    -Dinstall-tests=false

sources:
- kind: git_tag
  url: gnome:pango.git
  track: main
  match:
  - '1.45.*'
  ref: 1.45.5-0-gc8be5aecc2d3de5dd633ed491c4ccf5e8c96297c
