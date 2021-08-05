kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst

depends:
- components/libusb.bst
- components/glib.bst
- components/vala.bst

sources:
- kind: git_tag
  url: github:hughsie/libgusb.git
  track: master
  ref: 0.3.7-0-gff9c606d9d72c7dd369ad220d92729556faaaf0c
