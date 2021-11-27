kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/shared-mime-info.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/libtiff.bst
- filename: components/libpng.bst
- filename: components/jpeg.bst
- filename: components/gtk-doc.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: >
    -Dbuiltin_loaders=png,jpeg
    -Dinstalled_tests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/gdk-pixbuf-csource'
        - '%{bindir}/gdk-pixbuf-pixdata'
        - '%{bindir}/gdk-pixbuf-thumbnailer'
        - '%{libdir}/libgdk_pixbuf-2.0.so'

    integration-commands:
    - |
      gdk-pixbuf-query-loaders --update-cache

sources:
- kind: git_tag
  url: gnome:gdk-pixbuf.git
  track: master
  match:
  - 2.*[02468].*
  ref: 2.42.6-0-g3afa395cd47fdde70216a8a8e4d71ac753e26ade
