kind: autotools
description: libffi

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/texinfo.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libffi.so'

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git
  url: https://github.com/libffi/libffi
  track: master
  ref: 20562ac0427c3578250d04c6e34fb0127d4551cf   # 3.2.1
