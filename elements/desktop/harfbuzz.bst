kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/glib.bst
- filename: base/icu.bst
- filename: desktop/graphite2.bst
- filename: desktop/freetype-stage1.bst
  type: build
- filename: desktop/gtk-doc.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --with-icu \
    --with-gobject \
    --with-graphite2

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libharfbuzz-*.so'
        - '%{libdir}/libharfbuzz.so'

sources:
- kind: tar
  url: https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.8.4.tar.bz2
  ref: 3c592f86fa0da69e2e0e98cae9f5d5b61def3bb7948aa00ca45748f27fa545fd
