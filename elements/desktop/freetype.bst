kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libpng.bst
- filename: desktop/harfbuzz.bst
- filename: desktop/freetype-stage1.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/freetype-config'
        - '%{libdir}/libfreetype.so'

variables:
  conf-local: |
    --enable-freetype-config \
    --with-zlib=yes \
    --with-bzip2=yes \
    --with-png=yes \
    --with-harfbuzz=yes

config:
  configure-commands:
    (<):
      - ./autogen.sh

sources:
- kind: git_tag
  url: savannah:freetype/freetype2.git
  track: master
  ref: VER-2-9-1-0-g86bc8a95056c97a810986434a3f268cbe67f2902
