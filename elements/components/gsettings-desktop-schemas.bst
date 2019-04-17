kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/gettext.bst
  type: build

sources:
- kind: tar
  url: https://download.gnome.org/sources/gsettings-desktop-schemas/3.32/gsettings-desktop-schemas-3.32.0.tar.xz
  ref: 2d59b4b3a548859dfae46314ee4666787a00d5c82db382e97df7aa9d0e310a35
