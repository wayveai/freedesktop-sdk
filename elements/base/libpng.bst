kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpng.so'
        - '%{libdir}/libpng16.so'

sources:
- kind: git_tag
  url: https://git.code.sf.net/p/libpng/code
  track: libpng16
  ref: v1.6.35-0-gc17d164b4467f099b4484dfd4a279da0bc1dbd4a
