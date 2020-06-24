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
  track: master
  ref: 2.6.8-0-ge4203c14699cc0903a2b4611167a7b99532cfdb0
- kind: patch
  path: patches/harfbuzz/harfbuzz-disable-introspec-hb-language-invalid.patch
