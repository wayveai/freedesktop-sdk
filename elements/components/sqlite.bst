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
    version-match: '(\d)(\d\d)0(\d)00'
    patches:
    - CVE-2019-16168

sources:
- kind: tar
  url: tar_https:sqlite.org/2019/sqlite-autoconf-3290000.tar.gz
  ref: 8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b
- kind: patch
  path: patches/sqlite/CVE-2019-16168.patch
