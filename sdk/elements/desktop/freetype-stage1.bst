kind: autotools

depends:
  - filename: base/bzip2.bst
  - filename: base/libpng.bst
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
    --with-zlib=yes \
    --with-bzip2=yes \
    --with-png=yes \
    --with-harfbuzz=no

sources:
  - kind: tar
    url: http://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.bz2
    ref: e6ffba3c8cef93f557d1f767d7bc3dee860ac7a3aaff588a521e081bc36f4c8a
