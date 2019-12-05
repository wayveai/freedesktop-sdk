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
        - '%{libdir}/libpkgconf.so'

sources:
- kind: git_tag
  url: github:pkgconf/pkgconf.git
  track: master
  ref: pkgconf-1.6.0-0-ge2fdd6f47020bdfa670225d6f0763b082a419f91
