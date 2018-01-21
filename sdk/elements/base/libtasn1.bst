kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libtasn1.so"

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/libtasn1/libtasn1-4.12.tar.gz
    ref: 6753da2e621257f33f5b051cc114d417e5206a0818fe0b1ecfd6153f70934753

