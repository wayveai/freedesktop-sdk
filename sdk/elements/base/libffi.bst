kind: autotools
description: libffi

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/texinfo.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libffi.so"

config:
  install-commands:
    (>):
      - |
        rm "%{install-root}%{infodir}/dir"

sources:
  - kind: git
    url: https://github.com/libffi/libffi
    track: v3.2.1
    ref: 20562ac0427c3578250d04c6e34fb0127d4551cf # 3.2.1
