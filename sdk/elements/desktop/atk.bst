kind: autotools

depends:
  - filename: desktop/gobject-introspection.bst
  - filename: desktop/gtk-doc.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libatk-1.0.so"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/atk/2.27/atk-2.27.1.tar.xz
    ref: 673a953987b301ab1e24e7d11677b6e7ba3226411a168449ba946765b6d44297
