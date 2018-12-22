kind: autotools
description: Tool to help find memory-management problems in programs

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gdb.bst
- filename: base/perl.bst
  type: build

variables:
  # valgrind does not like stack protector flags
  common_flags: "-O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -grecord-gcc-switches"

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

sources:
- kind: git_tag
  url: https://repo.or.cz/valgrind.git
  track: master
  ref: VALGRIND_3_14_0-0-g3a3000290b4af0e8ef9880293c54659a6819ba78
- kind: patch
  path: patches/valgrind-arm-hot_cpu.patch
