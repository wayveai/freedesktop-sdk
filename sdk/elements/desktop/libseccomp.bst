kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libseccomp.so"

sources:
  - kind: git
    url: https://github.com/seccomp/libseccomp/
    track: v2.3.3
    ref: 74b190e1aa05f07da0c61fb9a30dbc9c18ce2c9d  # 2.3.3
