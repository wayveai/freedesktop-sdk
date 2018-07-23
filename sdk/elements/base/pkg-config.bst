kind: autotools
description: pkg-config

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
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
  - kind: git
    url: https://github.com/pkgconf/pkgconf
    ref: 4735e17287003b24e86b909f473af14771b8b32c  # 1.5.2
