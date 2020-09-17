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
- filename: components/brotli.bst

variables:
  meson-local: >
    -Dgssapi=disabled
    -Dvapi=disabled
    -Dntlm=disabled

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
  #track-extra:
  #- gnome-3-36
  match:
  - 2.70.*
  ref: 2.70.0-0-g3857ea93dd3775d68010efed7ad3245714fee379
