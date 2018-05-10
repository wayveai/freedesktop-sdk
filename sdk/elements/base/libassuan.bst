kind: autotools

depends:
  - filename: base/libgpg-error.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libassuan.so"

sources:
  - kind: tar
    url: https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.3.tar.bz2
    ref: 22843a3bdb256f59be49842abf24da76700354293a066d82ade8134bb5aa2b71
