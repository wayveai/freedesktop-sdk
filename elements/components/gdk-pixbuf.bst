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
  match:
  - 2.*[02468].*
  ref: 2.42.4-0-g88260c7794f60b5fee2127305d0b4bcfae0e8697
