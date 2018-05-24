kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/glib-networking.bst
  - filename: base/pkg-config.bst
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
          - "%{libdir}/libsoup-2.4.so"
          - "%{libdir}/libsoup-gnome-2.4.so"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/libsoup/2.60/libsoup-2.60.2.tar.xz
    ref: 7263cfe18872e2e652c196f5667e514616d9c97c861dfca82a65a55f45f0da01
