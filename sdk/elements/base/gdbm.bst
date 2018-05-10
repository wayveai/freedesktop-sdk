kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libgdbm.so"

sources:
  - kind: tar
    url: https://ftp.gnu.org/gnu/gdbm/gdbm-1.13.tar.gz
    ref: 9d252cbd7d793f7b12bcceaddda98d257c14f4d1890d851c386c37207000a253
