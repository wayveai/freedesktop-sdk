kind: myautotools
description: libffi

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/file.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libffi.so"

sources:
  - kind: tar
    url: ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz
    ref: d06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37
