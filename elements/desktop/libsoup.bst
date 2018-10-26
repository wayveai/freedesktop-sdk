kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/glib-networking.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/intltool.bst
  type: build
- filename: base/libxml2.bst
- filename: base/sqlite.bst
- filename: base/python3.bst
  type: build

variables:
  conf-local: |
    --disable-vala

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsoup-2.4.so'
        - '%{libdir}/libsoup-gnome-2.4.so'

sources:
- kind: tar
  url: https://download.gnome.org/sources/libsoup/2.62/libsoup-2.62.2.tar.xz
  ref: 9e536fe3da60b25d2c63addb84a9d5072d00b0d8b8cbeabc629a6bcd63f879b6
