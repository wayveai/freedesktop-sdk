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
  url: sourceforge:projects/libtirpc/files/libtirpc/1.1.4/libtirpc-1.1.4.tar.bz2
  ref: 2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d
