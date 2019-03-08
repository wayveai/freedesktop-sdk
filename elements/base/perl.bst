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
      -Duseshrplib \
      -Doptimize="none" \
      -Dccflags="$CFLAGS" \
      -Dldflags="$LDFLAGS" \
      -Dlddlflags="-shared $LDFLAGS"

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
- kind: git_tag
  url: 'perl5:'   # alias syntax requires ":" https://gitlab.com/BuildStream/buildstream/issues/720
  track: maint-5.28
  ref: v5.28.1-0-g63afdf6c0f65af480aa5bb9ccba9f46dae52f6fc
- kind: local
  path: files/perl/config.over
- kind: patch
  path: patches/perl/no-rpath-libpath.patch
