kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/glib-networking.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/libxml2.bst
- filename: components/sqlite.bst
- filename: components/libpsl.bst
- filename: components/python3.bst
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
  track: master
  track-extra:
  - gnome-3-32
  match:
  - 2.66.*
  ref: 2.66.4-0-gbdcf906745379df9d490bb214374512b84d5e8da
