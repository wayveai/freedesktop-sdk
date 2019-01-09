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
- kind: git_tag
  url: github:apple/cups.git
  track: master
  ref: v2.2.8-0-g4ebeb20c50145190312c9897efa26ed5b58b3bc5
