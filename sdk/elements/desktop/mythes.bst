kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/hunspell.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libmythes-1.2.so"

sources:
  - kind: tar
    url: http://downloads.sourceforge.net/hunspell/mythes-1.2.4.tar.gz
    ref: 1e81f395d8c851c3e4e75b568e20fa2fa549354e75ab397f9de4b0e0790a305f
