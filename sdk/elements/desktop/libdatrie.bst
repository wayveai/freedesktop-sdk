kind: myautotools

depends:
  - filename: base.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libdatrie.so"

sources:
  - kind: tar
    url: https://linux.thai.net/pub/thailinux/software/libthai/libdatrie-0.2.10.tar.xz
    ref: 180eff7b0309ca19a02d5864e744185d715f021398a096fec6cf960f8ebfaa2b
