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
        - '**'

sources:
- kind: git
  url: 'perl5:'   # alias syntax requires ":" https://gitlab.com/BuildStream/buildstream/issues/720
  ref: 6cb72a3d7fbefb477b95588e2fd81e33073da8b3    # v5.28.0
- kind: local
  path: files/perl/config.over
