kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/gmp.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libnettle.so"
          - "%{libdir}/libhogweed.so"

sources:
  - kind: tar
    url: https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz
    ref: ae7a42df026550b85daca8389b6a60ba6313b0567f374392e54918588a411e94
