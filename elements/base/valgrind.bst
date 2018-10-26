kind: autotools
description: Tool to help find memory-management problems in programs

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gdb.bst
- filename: base/perl.bst
  type: build

environment:
  # valgrind does not like stack protector flags
  CFLAGS: -O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions
    -grecord-gcc-switches
  CXXFLAGS: -O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions
    -grecord-gcc-switches
  LDFLAGS: -Wl,--as-needed,-z,relro,-z,now

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

sources:
- kind: git
  url: http://repo.or.cz/valgrind.git
  ref: 1378ec95f22235e0a8c972cf1cd0abef0b9610d4   # v3.13  (svn/VALGRIND_3_13_0)
- kind: patch
  path: patches/valgrind-arm-hot_cpu.patch
