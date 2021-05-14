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
  # track: master 2.7.3 breaks ABI
  ref: 2.7.2-0-g9c98b2b9a9e43669c5e2b37eaa41b1e07de1ede3
- kind: patch
  path: patches/harfbuzz/harfbuzz-disable-introspec-hb-language-invalid.patch
