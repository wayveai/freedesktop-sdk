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
  url: https://download.gnome.org/sources/gsettings-desktop-schemas/3.28/gsettings-desktop-schemas-3.28.0.tar.xz
  ref: 4cb4cd7790b77e5542ec75275237613ad22f3a1f2f41903a298cf6cc996a9167
