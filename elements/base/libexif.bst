kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexif.so'

sources:
- kind: git_tag
  url: https://github.com/libexif/libexif
  track: master
  ref: 9ab318d93b274df204c195c9a729f778401a8d8f   # 0.6.21
