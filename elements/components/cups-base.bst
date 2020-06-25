kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gzip.bst
- components/systemd.bst
- components/gnutls.bst

variables:
  builddir: ''
  conf-local: >-
    --enable-debug
    --with-components=all
    --with-dbusdir=/etc/dbus-1
    --enable-systemd
    --enable-threads
    --enable-gnutls
    --with-cups-group=lp
    --with-system-groups=wheel
    --with-rundir=/run/cups
    localedir=/usr/share/locale
    DSOFLAGS="$CFLAGS $LDFLAGS"

config:
  install-commands:
  - |
    make -j1 DSTROOT="%{install-root}" install

  - |
    tmpfilesdir="$(pkg-config --variable tmpfilesdir systemd)"
    install -Dm644 tmpfiles.conf "%{install-root}${tmpfilesdir}/cups.conf"

  - |
    sysusersdir="$(pkg-config --variable sysusersdir systemd)"
    install -Dm644 sysusers.conf "%{install-root}${sysusersdir}/cups.conf"

public:
  bst:
    split-rules:
      cups-libs:
      - '%{datadir}/locale'
      - '%{datadir}/locale/**'
      - '%{includedir}'
      - '%{includedir}/**'
      - '%{bindir}/cups-config'
      - '%{libdir}/lib*.so'
      - '%{libdir}/lib*.so.*'

sources:
- kind: git_tag
  url: github:apple/cups.git
  track: master
  ref: v2.3.3-0-g82e3ee0e3230287b76a76fb8f16b92ca6e50b444
- kind: patch
  path: patches/cups/cups-disable-werror.patch
- kind: local
  path: files/cups/tmpfiles.conf
- kind: local
  path: files/cups/sysusers.conf
