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
  ref: v2.3.3-0-g82e3ee0e3230287b76a76fb8f16b92ca6e50b444
- kind: patch
  path: patches/cups/cups-disable-werror.patch
