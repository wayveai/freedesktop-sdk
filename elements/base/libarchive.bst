kind: autotools
description: Glib

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libarchive.so'

sources:
- kind: tar
  url: https://libarchive.org/downloads/libarchive-3.3.2.tar.gz
  ref: ed2dbd6954792b2c054ccf8ec4b330a54b85904a80cef477a1c74643ddafa0ce
