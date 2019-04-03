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

config:
  configure-commands:
    (<):
      - ./autogen.sh

sources:
- kind: git_tag
  url: savannah:freetype/freetype2.git
  track: master
  ref: VER-2-9-1-0-g86bc8a95056c97a810986434a3f268cbe67f2902