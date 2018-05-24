kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/libogg.bst

variables:
  conf-local: |
    --with-speexdsp \
    --enable-binaries

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libspeex.so"

sources:
  - kind: tar
    url: https://downloads.xiph.org/releases/speex/speex-1.2.0.tar.gz
    ref: eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094
