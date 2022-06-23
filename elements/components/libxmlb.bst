kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- components/glib.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_tag
  url: github:hughsie/libxmlb.git
  track: main
  ref: 0.3.9-0-gc308e39ccad6673e216f92d08b3782a4ffcb23ad
