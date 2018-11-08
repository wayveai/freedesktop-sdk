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
  url: https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.0.2.tar.bz2
  ref: f6de6c9dc89a56909227ac3e3dc9b18924a0837936ffd9633d13e981bcbd96e0
