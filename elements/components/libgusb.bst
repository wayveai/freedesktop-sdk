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
  ref: 0.3.4-0-g377917fed85476d615f72279d0c97bc391d0f191
