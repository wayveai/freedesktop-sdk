kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/glib.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: desktop/vala.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgcab-1.0.so'

variables:
  meson-local: -Ddocs=false

sources:
- kind: git
  url: https://gitlab.gnome.org/GNOME/gcab
  track: master
  ref: 2d9af13213b41bdca4cecbaa5f192df71edc12be   #  v1.0
