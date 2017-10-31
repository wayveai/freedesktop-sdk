kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/glib-networking.bst

variables:
  conf-extra: |
    --disable-vala

sources:
  - kind: tar
    url: https://download.gnome.org/sources/libsoup/2.60/libsoup-2.60.2.tar.xz
    ref: 7263cfe18872e2e652c196f5667e514616d9c97c861dfca82a65a55f45f0da01
