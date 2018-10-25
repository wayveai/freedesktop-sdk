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
- kind: git
  url: https://git.code.sf.net/p/libpng/code
  ref: b78804f9a2568b270ebd30eca954ef7447ba92f7   # v1.6.34
