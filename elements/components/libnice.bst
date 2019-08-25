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
  ref: 0.1.16-0-g5969b34e3acd9150506ed8d9d109c73665858f3e
