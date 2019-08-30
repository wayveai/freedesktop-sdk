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
        - '%{libdir}/libcupsimage.so'
        - '%{datadir}/cups'
        - '%{datadir}/cups/**'

sources:
- kind: git_tag
  url: github:apple/cups.git
  track: master
  ref: v2.3.0-0-gee6be9cd7e863abf36b9b131fc379d967414aa2e
- kind: patch
  path: patches/cups/cups-disable-werror.patch
