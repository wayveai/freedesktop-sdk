kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libunistring.so'

sources:
- kind: tar
  url: ftp_gnu_org:libunistring/libunistring-0.9.10.tar.xz
  ref: eb8fb2c3e4b6e2d336608377050892b54c3c983b646c561836550863003c05d7
