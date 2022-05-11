kind: autotools
description: libffi

build-depends:
- components/autoconf2.69.bst
- components/texinfo.bst
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libffi.so'
        - '%{libdir}/libffi-3.2.1/include'
        - '%{libdir}/libffi-3.2.1/include/**'

variables:
  autogen: autoreconf2.69 -fvi

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: github:libffi/libffi.git
  track: master
  exclude:
  - v*-rc*
  ref: v3.4.2-0-gf9ea41683444ebe11cfa45b05223899764df28fb
