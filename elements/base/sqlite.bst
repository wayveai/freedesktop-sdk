kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    --enable-fts5 \
    CFLAGS="${CFLAGS} \
    -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_SECURE_DELETE=1 \
    -DSQLITE_ENABLE_FTS3=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
    -DSQLITE_ENABLE_DBSTAT_VTAB=1"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsqlite3.so'

  cpe:
    vendor: 'sqlite'
    version: '3.27.2'
    patches:
    - CVE-2019-8457
    - CVE-2019-9936
    - CVE-2019-9937

sources:
- kind: tar
  url: https://sqlite.org/2019/sqlite-autoconf-3270200.tar.gz
  ref: 50c39e85ea28b5ecfdb3f9e860afe9ba606381e21836b2849efca6a0bfe6ef6e
- kind: patch
  path: patches/sqlite/CVE-2019-8457.patch
- kind: patch
  path: patches/sqlite/CVE-2019-9937.patch
- kind: patch
  path: patches/sqlite/CVE-2019-9936.patch
