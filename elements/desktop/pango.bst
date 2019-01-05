kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/cairo.bst
- filename: desktop/harfbuzz.bst
- filename: desktop/fontconfig.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/which.bst
  type: build
- filename: desktop/fribidi.bst

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
   -Denable_docs=false \
   -Dgir=true

sources:
- kind: git_tag
  url: gnome:pango
  track: master
  ref: 1.42.4-0-ga6a89818246b0b14c0fe3d00d6120929fc0a11d9
