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
    ln -s perl5.30.0 "%{install-root}%{bindir}/perl"

sources:
- kind: git_tag
  url: github:perl/perl5.git
  track: blead
  track-extra:
  - maint-5.30
  match:
  - v5.*[02468].*
  exclude:
  - v*-RC*
  ref: v5.30.1-0-g92dc8555fd2841214d65c8e754898f4079ec46bf
- kind: local
  path: files/perl/config.over
- kind: patch
  path: patches/perl/no-rpath-libpath.patch
