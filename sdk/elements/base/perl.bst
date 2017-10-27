kind: manual
description: GNU libtool

depends:
  - filename: bootstrap-import.bst

config:
  configure-commands:
    - |
      sh Configure -des \
        -Dprefix="%{prefix}" \
        -Dvendorprefix="%{prefix}" \
        -Dman1dir="%{mandir}/man1" \
        -Dman3dir="%{mandir}/man3" \
        -Dlibpth="%{libdir}" \
        -Dcc=gcc \
        -Duseshrplib

  build-commands:
    - |
      make

  install-commands:
    - |
      make -j1 DESTDIR="%{install-root}" install

sources:
  - kind: tar
    url: http://www.cpan.org/src/5.0/perl-5.26.1.tar.gz
    ref: e763aa485e8dc1a70483dbe6d615986bbf32b977f38016480d68c99237e701dd

