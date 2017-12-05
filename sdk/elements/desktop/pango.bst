kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/cairo.bst
  - filename: desktop/harfbuzz.bst
  - filename: desktop/fontconfig.bst
  - filename: desktop/gobject-introspection.bst
  - filename: desktop/gtk-doc.bst

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
    url: https://download.gnome.org/sources/pango/1.40/pango-1.40.13.tar.xz
    ref: f84e98db1078772ff4935b40a1629ff82ef0dfdd08d2cbcc0130c8c437857196

