kind: myautotools
description: file

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libmagic.so"

sources:
  - kind: tar
    url: ftp://ftp.astron.com/pub/file/file-5.32.tar.gz
    ref: 8639dc4d1b21e232285cd483604afc4a6ee810710e00e579dbe9591681722b50
