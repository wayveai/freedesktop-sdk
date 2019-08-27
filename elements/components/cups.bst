kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gnutls.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gzip.bst
  type: build

variables:
  builddir: ''
  conf-local: |
    --enable-debug \
    --with-components=core \
    --with-dbusdir=/etc/dbus-1 \
    --disable-systemd \
    --enable-threads \
    --enable-gnutls \
    localedir=/usr/share/locale \
    DSOFLAGS="$CFLAGS $LDFLAGS"

config:
  install-commands:
  - |
    make -j1 DSTROOT="%{install-root}" install

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/cups-config'
        - '%{libdir}/libcups.so'
        - '%{datadir}/cups'
        - '%{datadir}/cups/**'

sources:
- kind: git_tag
  url: github:apple/cups.git
  track: branch-2.2
  track-extra:
  - v2.2.12
  ref: v2.2.12-0-gc8cb6400e317633f66cdc87884915d54710b53a0
- kind: patch
  path: patches/cups/cups-disable-werror.patch
