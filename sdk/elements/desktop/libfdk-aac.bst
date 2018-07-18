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

sources:
  - kind: git
    url: git://people.freedesktop.org/~wtay/fdk-aac
    track: stripped2
    ref: 4b07abf077727764ba16fe0fe28ce5561e66b809
