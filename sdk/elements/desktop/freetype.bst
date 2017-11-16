kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/harfbuzz.bst
  - filename: desktop/freetype-stage1.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{bindir}/freetype-config"
        - "%{libdir}/libfreetype.so"

variables:
  conf-extra: |

    --with-zlib=yes \
    --with-bzip2=yes \
    --with-png=yes \
    --with-harfbuzz=yes

sources:
  - kind: tar
    url: http://download.savannah.gnu.org/releases/freetype/freetype-2.8.1.tar.bz2
    ref: e5435f02e02d2b87bb8e4efdcaa14b1f78c9cf3ab1ed80f94b6382fb6acc7d78
