kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst
- components/flex.bst
- components/gtk-doc.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/python3.bst
- components/python3-mako.bst
- components/python3-markdown.bst


variables:
  meson-local: >-
    -Dcairo=disabled
    -Dgtk_doc=true
    -Ddoctool=enabled

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
  track: main
  track-extra:
  - gnome-3-38
  ref: 1.72.0-0-gc1ce7d179cfce327162bd206cdf2808bd9bd0cc7
