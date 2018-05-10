kind: autotools
description: pkg-config

depends:
  - filename: bootstrap-import.bst
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build

config:
  install-commands:
    (>):
      - |
        ln -s pkgconf "%{install-root}%{bindir}/pkg-config"
        ln -s pkgconf.1 "%{install-root}%{mandir}/man1/pkg-config.1"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libpkgconf.so"

sources:
  - kind: tar
    url: https://github.com/pkgconf/pkgconf/archive/pkgconf-1.4.2.tar.gz
    ref: 24307a1970e51809b61219cd3c1ac61f44efb5f3867024672b57a76fa6bc6e82
