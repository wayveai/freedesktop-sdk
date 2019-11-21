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
- kind: git_tag
  url: github:libffi/libffi.git
  track: master
  ref: v3.2.1-0-g20562ac0427c3578250d04c6e34fb0127d4551cf
