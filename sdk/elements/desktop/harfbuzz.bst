kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/graphite2.bst
  - filename: base/glib.bst
  - filename: desktop/freetype-stage1.bst
    type: build
  - filename: desktop/gtk-doc.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
    --with-gobject \
    --with-graphite2

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libharfbuzz-*.so"
          - "%{libdir}/libharfbuzz.so"

sources:
  - kind: tar
    url: https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.7.6.tar.bz2
    ref: da7bed39134826cd51e57c29f1dfbe342ccedb4f4773b1c951ff05ff383e2e9b
