kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/liblzma.so"

sources:
  - kind: tar
    url: https://tukaani.org/xz/xz-5.2.3.tar.xz
    ref: 7876096b053ad598c31f6df35f7de5cd9ff2ba3162e5a5554e4fc198447e0347
