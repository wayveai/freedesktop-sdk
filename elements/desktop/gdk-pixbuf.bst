kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/shared-mime-info.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/libtiff.bst
- filename: base/libpng.bst
- filename: base/jpeg.bst
- filename: desktop/gtk-doc.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/gettext.bst
  type: build

variables:
  meson-local: >
    -Dx11=false
    -Djasper=false
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
  ref: 2.38.0-0-g0b1eab312e77701c20b07fb8e38119009f8b34c3
