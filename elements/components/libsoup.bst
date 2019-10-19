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
  track-extra:
  - gnome-3-32
  match:
  - 2.[0-9][02468].*
  ref: 2.68.2-0-g5b2cf0eab0386322ed3f25d9b671c00dfbb93471
