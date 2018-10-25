kind: autotools

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
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --without-x11 \
    --without-libjasper \
    --with-included-loaders=png,jpeg

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
- kind: tar
  url: https://download.gnome.org/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.12.tar.xz
  ref: fff85cf48223ab60e3c3c8318e2087131b590fd6f1737e42cb3759a3b427a334
