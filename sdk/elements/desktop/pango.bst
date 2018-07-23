kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/cairo.bst
  - filename: desktop/harfbuzz.bst
  - filename: desktop/fontconfig.bst
  - filename: desktop/gobject-introspection.bst
  - filename: desktop/gtk-doc.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: desktop/fribidi.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libpango-1.0.so"
          - "%{libdir}/libpangoft2-1.0.so"
          - "%{libdir}/libpangocairo-1.0.so"

sources:
  - kind: tar
    url: https://ftp.gnome.org/pub/gnome/sources/pango/1.42/pango-1.42.2.tar.xz
    ref: b1e416b4d40416ef6c8224cf146492b86848703264ba88f792290992cf3ca1e2

