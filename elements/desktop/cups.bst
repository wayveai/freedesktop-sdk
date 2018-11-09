kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/gnutls.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gzip.bst
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
    localedir=/usr/share/locale

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

sources:
- kind: tar
  url: github:apple/cups/releases/download/v2.2.8/cups-2.2.8-source.tar.gz
  ref: 3968fc1d26fc48727508db1c1380e36c6694ab90177fd6920aec5f6cc73af9e4
