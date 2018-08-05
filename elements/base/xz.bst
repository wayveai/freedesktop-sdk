kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/liblzma.so"

sources:
  - kind: tar
    url: https://tukaani.org/xz/xz-5.2.4.tar.xz
    ref: 9717ae363760dedf573dad241420c5fea86256b65bc21d2cf71b2b12f0544f4b
