kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libexif.so"

sources:
  - kind: tar
    url: https://download.sourceforge.net/libexif/libexif-0.6.21.tar.bz2
    ref: 16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a
