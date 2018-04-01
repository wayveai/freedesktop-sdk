kind: autotools

depends:
  - filename: base.bst
    type: build

variables:
  conf-local:
    PYTHON="/usr/bin/python2"

sources:
  # itstool 2.0.4 crashes when building gtk-doc
  - kind: tar
    url: http://files.itstool.org/itstool/itstool-2.0.3.tar.bz2
    ref: 8c7a5c639eb4714a91ad829910fd06c1c677abcbbb60aee9211141faa7fb02c7
