kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst
- filename: components/python3.bst
- filename: components/gtk-doc.bst
  type: build
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
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
  url: gnome:gobject-introspection.git
  track: gnome-3-32
  ref: 1.60.2-0-g41edb870614e12947db8e35af9846b19f1b8d71a
