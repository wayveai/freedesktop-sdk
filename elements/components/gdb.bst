kind: autotools
description: GNU debugger

depends:
- bootstrap-import.bst
- components/python3.bst
- components/debuginfod.bst

build-depends:
- components/texinfo.bst
- components/perl.bst
- components/flex.bst
- components/bison.bst

variables:
  conf-link-args: >-
    --enable-shared

  conf-local: >-
    --disable-binutils
    --disable-ld
    --disable-gold
    --disable-gas
    --disable-sim
    --disable-gprof
    --without-zlib
    --with-system-zlib
    --with-python=/usr/bin/python3
    --disable-readline
    --with-system-readline
    --disable-install-libbfd
    --disable-install-libiberty
    --with-debuginfod
    --with-separate-debug-dir="%{debugdir}"

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"
      rm -f "%{install-root}%{infodir}/bfd.info"
      rm -f "%{install-root}%{datadir}"/locale/*/LC_MESSAGES/bfd.mo
      rm -f "%{install-root}%{datadir}"/locale/*/LC_MESSAGES/opcodes.mo

sources:
- kind: git_tag
  url: sourceware:binutils-gdb.git
  track: gdb-9-branch
  ref: gdb-9.2-release-0-ge7fe0803b6427d3906e991bbb3b7fd2f0fd05e00

