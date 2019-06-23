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

sources:
- kind: git_tag
  url: savannah:freetype/freetype2.git
  track: master
  ref: VER-2-10-0-0-gfbbcf50367403a6316a013b51690071198962920
