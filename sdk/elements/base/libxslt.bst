kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/libxml2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libxslt.so"
          - "%{libdir}/libexslt.so"

sources:
  - kind: tar
    url: ftp://xmlsoft.org/libxml2/libxslt-1.1.31.tar.gz
    ref: db25e96b6b801144277e67c05b10560ac09dfff82ccd53a154ce86e43622f3ab
