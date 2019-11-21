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

  - |
    rm -r "%{install-root}%{bindir}/perl"
    ln -s perl5.28.2 "%{install-root}%{bindir}/perl"

sources:
- kind: git_tag
  url: github:perl/perl5.git
  track: maint-5.28
  match:
  - v5.*[02468].*
  ref: v5.28.2-0-gc763da0e1c4ed5f24d490617b5a28c81fb69f6c4
- kind: local
  path: files/perl/config.over
- kind: patch
  path: patches/perl/no-rpath-libpath.patch
