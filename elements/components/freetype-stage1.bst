kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libpng.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --enable-freetype-config \
    --with-zlib=yes \
    --with-bzip2=yes \
    --with-png=yes \
    --with-harfbuzz=no

config:
  configure-commands:
    (<):
    - ./autogen.sh

(@):
- elements/include/freetype.yml
