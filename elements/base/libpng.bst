kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libpng.so"
          - "%{libdir}/libpng16.so"

sources:
  - kind: tar
    url: https://ftp-osl.osuosl.org/pub/libpng/src/libpng16/libpng-1.6.34.tar.gz
    ref: 574623a4901a9969080ab4a2df9437026c8a87150dfd5c235e28c94b212964a7
