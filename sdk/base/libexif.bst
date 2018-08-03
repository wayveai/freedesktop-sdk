kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/gettext.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libexif.so"

sources:
  - kind: git
    url: https://github.com/libexif/libexif
    track: libexif-0_6_21-release
    ref: 9ab318d93b274df204c195c9a729f778401a8d8f # 0.6.21
