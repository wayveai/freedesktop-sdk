kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    --enable-fts5 \
    CPPFLAGS="${CPPFLAGS} -DSQLITE_ENABLE_COLUMN_METADATA=1"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsqlite3.so'

sources:
- kind: tar
  url: https://sqlite.org/2018/sqlite-autoconf-3240000.tar.gz
  ref: d9d14e88c6fb6d68de9ca0d1f9797477d82fc3aed613558f87ffbdbbc5ceb74a
