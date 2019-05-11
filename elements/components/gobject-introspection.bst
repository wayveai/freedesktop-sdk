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
  url: gnome:gobject-introspection
  track: gnome-3-30
  ref: 1.58.3-0-g96e0b3f92624937093f0c683db6968bc53c694eb
