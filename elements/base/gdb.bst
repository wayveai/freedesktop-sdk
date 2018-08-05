kind: autotools
description: GNU debugger

depends:
  - filename: bootstrap-import.bst
  - filename: base/texinfo.bst
    type: build
  - filename: base/perl.bst
    type: build

variables:
  conf-link-args: |
    --enable-shared

  conf-local: |
    --without-zlib \
    --with-system-zlib \
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
  - kind: tar
    url: https://ftp.gnu.org/gnu/gdb/gdb-8.1.tar.xz
    ref: af61a0263858e69c5dce51eab26662ff3d2ad9aa68da9583e8143b5426be4b34
