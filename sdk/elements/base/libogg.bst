kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libogg.so"

sources:
  - kind: tar
    url: http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz
    ref: e19ee34711d7af328cb26287f4137e70630e7261b17cbe3cd41011d73a654692
