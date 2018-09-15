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
  url: https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.9.0.tar.bz2
  ref: 11eca62bf0ac549b8d6be55f4e130946399939cdfe7a562fdaee711190248b00
