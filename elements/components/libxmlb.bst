kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- components/glib.bst

sources:
- kind: git_tag
  url: github:hughsie/libxmlb.git
  track: master
  track-extra:
  - 0_1_X
  ref: 0.1.15-0-gee4aafdd97844f1c73021a4978a43460f0835d5c
