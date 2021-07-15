kind: autotools

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgdbm.so'

sources:
- kind: tar
  url: ftp_gnu_org:gdbm/gdbm-1.20.tar.gz
  ref: 3aeac05648b3482a10a2da986b9f3a380a29ad650be80b9817a435fb8114a292
