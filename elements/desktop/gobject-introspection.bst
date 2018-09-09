kind: autotools

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
- filename: base/buildsystem-autotools.bst
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
- kind: tar
  url: https://download.gnome.org/sources/gobject-introspection/1.56/gobject-introspection-1.56.1.tar.xz
  ref: 5b2875ccff99ff7baab63a34b67f8c920def240e178ff50add809e267d9ea24b
