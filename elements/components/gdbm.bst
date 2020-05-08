kind: autotools

variables:
  # gdbm 1.18.1 does not build with GCC 10 without -fcommon
  local_flags: -fcommon

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
  url: ftp_gnu_org:gdbm/gdbm-1.18.1.tar.gz
  ref: 86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f745b91dc
