kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-docutils.bst

depends:
- bootstrap-import.bst
- components/jpeg.bst
- components/libpng.bst
- components/libtiff.bst
- components/shared-mime-info.bst

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
  ref: 2.42.9-0-g9b74d8dced44955b778fa1eac4fd0d29d5809e9d
