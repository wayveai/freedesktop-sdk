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
  track: master
  ref: 1.44.7-0-g9f03d48261cb25e59ba029b194e70881d6ae8f37
