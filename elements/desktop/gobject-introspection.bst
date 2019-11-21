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
  url: gnome:gobject-introspection.git
  track: gnome-3-30
  ref: 1.58.3-0-g96e0b3f92624937093f0c683db6968bc53c694eb
