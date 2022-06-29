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
  url: ftp_gnu_org:libunistring/libunistring-1.0.tar.xz
  ref: 5bab55b49f75d77ed26b257997e919b693f29fd4a1bc22e0e6e024c246c72741
