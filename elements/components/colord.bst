kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/vala.bst

depends:
- components/glib.bst
- components/lcms.bst
- components/libgudev.bst
- components/libgusb.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Dargyllcms_sensor=false
    -Dbash_completion=false
    -Dlibcolordcompat=false
    -Dman=false
    -Dvapi=true

sources:
- kind: git_tag
  url: github:hughsie/colord.git
  track: master
  ref: 1.4.4-0-g233e642f730e46e026c1fe45d36ea298de1e00fe
