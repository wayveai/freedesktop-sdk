kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libfdk-aac.so"

sources:
  - kind: git
    url: git://people.freedesktop.org/~wtay/fdk-aac
    track: stripped2
    ref: ba7ffc9dd95b73b2b5f465f127609aa4235f6800
