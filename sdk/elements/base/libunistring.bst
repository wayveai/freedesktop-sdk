kind: myautotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libunistring.so"

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/libunistring/libunistring-0.9.7.tar.xz
    ref: 2e3764512aaf2ce598af5a38818c0ea23dedf1ff5460070d1b6cee5c3336e797
