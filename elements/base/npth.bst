kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnpth.so'

sources:
- kind: tar
  url: https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2
  ref: 1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1
