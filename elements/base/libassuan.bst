kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgpg-error.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libassuan.so'

sources:
- kind: tar
  url: https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.1.tar.bz2
  ref: 47f96c37b4f2aac289f0bc1bacfa8bd8b4b209a488d3d15e2229cb6cc9b26449
