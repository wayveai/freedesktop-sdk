kind: myautotools
description: zlib

depends:
  - filename: bootstrap-import.bst
    type: build

variables:
  conf-args: |
    --prefix=%{prefix} \
    --sharedlibdir=%{libdir} \
    --libdir=%{libdir}

config:
  install-commands:
    (>):
      - rm -f "%{install-root}%{libdir}/libz.a"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libz.so"

sources:
  - kind: tar
    url: http://zlib.net/zlib-1.2.11.tar.xz
    ref: 4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066
