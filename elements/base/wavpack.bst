kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libwavpack.so"

sources:
- kind: tar
  url: http://wavpack.com/wavpack-5.1.0.tar.bz2
  ref: 1939627d5358d1da62bc6158d63f7ed12905552f3a799c799ee90296a7612944
