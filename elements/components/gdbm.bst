kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgdbm.so'

sources:
- kind: tar
  url: ftp_gnu_org:gdbm/gdbm-1.16.tar.gz
  ref: c8a18bc6259da0c3eefefb018f8aa298fddc6f86c6fc0f0dec73270896ab512f
