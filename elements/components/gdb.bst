kind: autotools
description: GNU debugger

depends:
- filename: bootstrap-import.bst
- filename: components/texinfo.bst
  type: build
- filename: components/perl.bst
  type: build
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: components/python3.bst

variables:
  conf-link-args: |
    --enable-shared

  conf-local: |
    --disable-binutils \
    --disable-ld \
    --disable-gold \
    --disable-gas \
    --disable-sim \
    --disable-gprof \
    --without-zlib \
    --with-system-zlib \
    --with-python=/usr/bin/python3 \
    --disable-readline \
    --with-system-readline \
    --disable-install-libbfd \
    --disable-install-libiberty \
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

