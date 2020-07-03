kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: >-
    --disable-gssapi
  local_flags: -fcommon

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtirpc.so'

sources:
- kind: tar
  url: sourceforge:projects/libtirpc/files/libtirpc/1.2.6/libtirpc-1.2.6.tar.bz2
  ref: 4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc
