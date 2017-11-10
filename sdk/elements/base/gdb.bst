kind: myautotools
description: GNU debugger

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/texinfo.bst
    type: build
  - filename: base/perl.bst
    type: build

variables:
  conf-link-args: |
    --enable-shared

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libbfd.so"
        - "%{libdir}/libopcodes.so"

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/gdb/gdb-8.0.1.tar.xz
    ref: 3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3
