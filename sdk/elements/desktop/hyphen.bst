kind: myautotools

depends:
  - filename: base.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libhyphen.so"

sources:
  - kind: tar
    url: http://downloads.sourceforge.net/hunspell/hyphen-2.8.8.tar.gz
    ref: 304636d4eccd81a14b6914d07b84c79ebb815288c76fe027b9ebff6ff24d5705
