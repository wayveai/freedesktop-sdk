kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libpng.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --enable-freetype-config \
    --with-zlib=yes \
    --with-bzip2=yes \
    --with-png=yes \
    --with-harfbuzz=no

sources:
- kind: tar
  url: https://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.bz2
  ref: db8d87ea720ea9d5edc5388fc7a0497bb11ba9fe972245e0f7f4c7e8b1e1e84d
