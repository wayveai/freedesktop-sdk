kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst
- filename: components/python3.bst
- filename: components/python3-mako.bst
- filename: components/python3-markdown.bst
- filename: components/gtk-doc.bst
  type: build
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: >-
    -Dgtk_doc=true
    -Ddoctool=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/gobject-introspection/giscanner'
        - '%{libdir}/gobject-introspection/giscanner/**'
        - '%{datadir}/gir-1.0'
        - '%{datadir}/gir-1.0/**'
        - '%{datadir}/gobject-introspection-1.0'
        - '%{datadir}/gobject-introspection-1.0/**'
        - '%{bindir}/g-ir-*'
        - '%{libdir}/libgirepository-1.0.so'

sources:
- kind: git_tag
  url: gnome:gobject-introspection.git
  track: gnome-3-34
  ref: 1.62.0-0-gf330f517d8cd0bfbe67c62ba00be85dee2b338ed
