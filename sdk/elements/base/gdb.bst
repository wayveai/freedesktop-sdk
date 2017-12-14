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
    url: http://ftp.gnu.org/gnu/gdb/gdb-8.0.1.tar.xz
    ref: 3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3
