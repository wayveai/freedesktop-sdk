kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/gtk-doc.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/gobject-introspection/giscanner"
          - "%{datadir}/gobject-introspection/giscanner"
          - "%{bindir}/g-ir-*"
          - "%{libdir}/libgirepository-1.0.so"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/gobject-introspection/1.54/gobject-introspection-1.54.1.tar.xz
    ref: b88ded5e5f064ab58a93aadecd6d58db2ec9d970648534c63807d4f9a7bb877e
