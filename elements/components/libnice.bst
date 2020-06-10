kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst
- filename: components/gnutls.bst
- filename: components/gstreamer.bst
  type: build
- filename: components/gobject-introspection.bst
  type: build
- filename: components/gtk-doc.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnice.so'

variables:
  meson-local: >-
    -Dgupnp=disabled
    -Dexamples=disabled

sources:
- kind: git_tag
  url: freedesktop:libnice/libnice.git
  track: master
  ref: 0.1.17-0-g5fb2511725a690a68ed9ace030931b78bc6fe92c
