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
  track: gdb-8.3-branch
  ref: gdb-8.3.1-release-0-gff51bf260c36157d13a6ca86969b6a64c7896d55
# Patch is included in upstream 8.4. Remove when upgrading.
- kind: patch
  path: patches/gdb/gdb-do-not-emit-escape-sequences-to-log-file.patch
