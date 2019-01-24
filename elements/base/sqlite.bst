kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    --enable-fts5 \
    CFLAGS="${CFLAGS} -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_SECURE_DELETE=1"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsqlite3.so'

  cpe:
    vendor: 'sqlite'
    version: '3.26.0'

sources:
- kind: tar
  url: https://sqlite.org/2018/sqlite-autoconf-3260000.tar.gz
  ref: 5daa6a3fb7d1e8c767cd59c4ded8da6e4b00c61d3b466d0685e35c4dd6d7bf5d
