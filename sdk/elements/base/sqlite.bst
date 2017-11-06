kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libsqlite3.so"

sources:
  - kind: tar
    url: https://sqlite.org/2017/sqlite-autoconf-3210000.tar.gz
    ref: d7dd516775005ad87a57f428b6f86afd206cb341722927f104d3f0cf65fbbbe3


