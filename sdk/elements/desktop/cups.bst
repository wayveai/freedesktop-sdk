kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/gnutls.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/gzip.bst
    type: build

variables:
  builddir: ''
  conf-local: |
    --enable-debug \
    --with-components=core \
    --with-dbusdir=/etc/dbus-1 \
    --enable-avahi \
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
          - "%{bindir}/cups-config"
          - "%{libdir}/libcups.so"

sources:
  - kind: tar
    url: https://github.com/apple/cups/releases/download/v2.2.6/cups-2.2.6-source.tar.gz
    ref: 40385778c2b3bdf55030d1c999734e22774c79e3425d91339ce677825620169b
