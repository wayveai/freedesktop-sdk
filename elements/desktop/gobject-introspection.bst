kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/glib.bst
- filename: base/python3.bst
- filename: desktop/gtk-doc.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/which.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/gobject-introspection/giscanner'
        - '%{datadir}/gobject-introspection/giscanner'
        - '%{bindir}/g-ir-*'
        - '%{libdir}/libgirepository-1.0.so'

sources:
- kind: git_tag
  url: gnome:gobject-introspection
  track: gnome-3-30
  ref: 1.58.2-0-g8796f5f17df75c6f9e726bf1549bb6d1508793f0
