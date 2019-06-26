kind: autotools
description: GNU debugger

depends:
- filename: bootstrap-import.bst
- filename: base/texinfo.bst
  type: build
- filename: base/perl.bst
  type: build
- filename: base/python3.bst

variables:
  conf-link-args: |
    --enable-shared

  conf-local: |
    --without-zlib \
    --with-system-zlib \
    --with-python=/usr/bin/python3 \
    --disable-readline \
    --with-system-readline \
    --disable-install-libbfd \
    --disable-install-libiberty \
    --with-separate-debug-dir="%{debugdir}"

public:
  bst:
    split-rules:
      devel:
      - '%{libdir}/libstdc++.so.*-gdb.py'
      - '%{datadir}/gcc-*/python/**'

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
  url: ftp_gnu_org:gdb/gdb-8.2.1.tar.xz
  ref: 0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202
