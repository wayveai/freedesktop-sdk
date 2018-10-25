kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/libdatrie.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libthai.so'

sources:
- kind: tar
  url: https://linux.thai.net/pub/thailinux/software/libthai/libthai-0.1.27.tar.xz
  ref: 1659fa1b7b1d6562102d7feb8c8c3fd94bb2dc5761ed7dbaae4f300e1c03eff6
