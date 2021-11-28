kind: autotools

depends:
- bootstrap-import.bst
- components/glib.bst
- components/icu.bst
- components/graphite2.bst

build-depends:
- components/freetype-stage1.bst
- components/gtk-doc.bst
- public-stacks/buildsystem-autotools.bst
- components/gobject-introspection.bst

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
  # Frozen since next release adds new API
  ref: 3.0.0-0-g9c387e20d65a7a366ac270d789f6ad266014c9e0
