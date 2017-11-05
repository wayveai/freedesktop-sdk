kind: myautotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/gmp.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libnettle.so"
        - "%{libdir}/libhogweed.so"

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/nettle/nettle-3.3.tar.gz
    ref: 46942627d5d0ca11720fec18d81fc38f7ef837ea4197c1f630e71ce0d470b11e
