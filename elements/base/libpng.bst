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
  ref: v1.6.36-0-geddf9023206dc40974c26f589ee2ad63a4227a1e
