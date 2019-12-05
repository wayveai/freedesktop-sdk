kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/glib-networking.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/libxml2.bst
- filename: base/sqlite.bst
- filename: desktop/libpsl.bst
- filename: base/python3.bst
  type: build

variables:
  meson-local: >
    -Dgssapi=false
    -Dvapi=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsoup-2.4.so'
        - '%{libdir}/libsoup-gnome-2.4.so'

sources:
- kind: git_tag
  url: gnome:libsoup.git
  track: gnome-3-30
  ref: 2.64.2-0-gb25faf59f1bb782e95be94f70a98a369846d1524
