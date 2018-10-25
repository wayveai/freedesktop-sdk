kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgif.so'

sources:
- kind: tar
  url: https://download.sourceforge.net/giflib/giflib-5.1.4.tar.bz2
  ref: df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5
