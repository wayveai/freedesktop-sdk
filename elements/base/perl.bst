kind: manual

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

public:
  bst:
    split-rules:
      devel:
        (>):
          - "**"

sources:
  - kind: tar
    url: https://www.cpan.org/src/5.0/perl-5.28.0.tar.gz
    ref: 7e929f64d4cb0e9d1159d4a59fc89394e27fa1f7004d0836ca0d514685406ea8
  - kind: local
    path: files/perl/config.over
