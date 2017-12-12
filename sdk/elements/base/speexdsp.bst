kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libspeexdsp.so"

sources:
  - kind: tar
    url: https://downloads.xiph.org/releases/speex/speexdsp-1.2rc3.tar.gz
    ref: 4ae688600039f5d224bdf2e222d2fbde65608447e4c2f681585e4dca6df692f1
