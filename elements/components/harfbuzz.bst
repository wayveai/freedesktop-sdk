kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst
- filename: components/icu.bst
- filename: components/graphite2.bst
- filename: components/freetype-stage1.bst
  type: build
- filename: components/gtk-doc.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
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
- kind: git_tag
  url: github:harfbuzz/harfbuzz.git
  track: master
  ref: 2.6.0-0-g6461143b44f81a4190d3f1cb02238750536f08e4
