kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/tcl.bst
  type: build

variables:
  conf-local: |
    --enable-fts5 \
    CFLAGS="${CFLAGS} \
    -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_SECURE_DELETE=1 \
    -DSQLITE_ENABLE_FTS3=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
    -DSQLITE_ENABLE_DBSTAT_VTAB=1"

config:
  configure-commands:
    (>):
    - sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' bst_build_dir/libtool
    - sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' bst_build_dir/libtool

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsqlite3.so'

  cpe:
    vendor: 'sqlite'

sources:
- kind: git_tag
  url: github:sqlite/sqlite.git
  track: master
  match:
  - 'version-*'
  ref: version-3.32.1-0-gd63c76fb31a0e262fb12a93b171e95a4e30c1a2e
