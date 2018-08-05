kind: autotools
description: Tool to help find memory-management problems in programs

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/gdb.bst
  - filename: base/perl.bst
    type: build

environment:
  # valgrind does not like stack protector flags
  CPPFLAGS: "-O2"
  CFLAGS: "-O2 -g"
  CXXFLAGS: "-O2 -g"
  LDFLAGS: "-Wl,-z,relro,-z,now"

config:
  configure-commands:
    (<):
      - |
        autoreconf -ivf

sources:
  - kind: tar
    url: https://sourceware.org/pub/valgrind/valgrind-3.13.0.tar.bz2
    ref: d76680ef03f00cd5e970bbdcd4e57fb1f6df7d2e2c071635ef2be74790190c3b
  - kind: patch
    path: patches/valgrind-arm-hot_cpu.patch
