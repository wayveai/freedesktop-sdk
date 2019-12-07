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
  url: tar_https:www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.3.0.tar.bz2
  ref: 3b314db655a41d19481e18312465fa25fca6f63382217f08062f126059f96764
