kind: autotools
description: pkg-config

depends:
- filename: bootstrap-import.bst
- filename: components/autoconf.bst
  type: build
- filename: components/automake.bst
  type: build
- filename: components/libtool.bst
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
  ref: pkgconf-1.6.3-0-gc862e030cf83447f679e4f49876f5298f0fc9691
