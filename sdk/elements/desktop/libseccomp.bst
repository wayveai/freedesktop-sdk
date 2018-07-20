kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libseccomp.so"

sources:
  - kind: git
    url: https://github.com/seccomp/libseccomp/
    track: libseccomp v2.3.3
    ref: 74b190e1aa05f07da0c61fb9a30dbc9c18ce2c9d  # 2.3.3
