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

sources:
- kind: git_tag
  url: github:apple/cups.git
  track: master
  ref: v2.2.10-0-g25b2338346ef3abbb93ea88476887cba7b2b86f8
