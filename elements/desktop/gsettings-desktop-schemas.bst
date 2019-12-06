kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/intltool.bst
  type: build

sources:
- kind: tar
  url: tar_https:download.gnome.org/sources/gsettings-desktop-schemas/3.28/gsettings-desktop-schemas-3.28.1.tar.xz
  ref: f88ea6849ffe897c51cfeca5e45c3890010c82c58be2aee18b01349648e5502f
