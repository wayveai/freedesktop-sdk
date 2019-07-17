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
  - 2.[0-9][02468].*
  ref: 2.66.2-0-gdcb4ef51405109766b7f49b1408f98295bd9351f
