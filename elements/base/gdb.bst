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
  url: ftp_gnu_org:gdb/gdb-8.2.tar.xz
  ref: c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39
