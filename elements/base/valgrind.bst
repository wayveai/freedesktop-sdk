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
  url: http://repo.or.cz/valgrind.git
  track: svn/VALGRIND_3_13_0
  ref: svn/VALGRIND_3_13_0-0-g1378ec95f22235e0a8c972cf1cd0abef0b9610d4
- kind: patch
  path: patches/valgrind-arm-hot_cpu.patch
