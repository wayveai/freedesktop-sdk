kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/json-glib.bst
  - filename: base/glib.bst
  - filename: desktop/gobject-introspection.bst
    type: build
  - filename: desktop/libsoup.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/intltool.bst
    type: build

variables:
  conf-local: |
    --disable-3g-source \
    --disable-cdma-source \
    --disable-modem-gps-source \
    --disable-nmea-source \
    --enable-demo-agent=no

config:
  install-commands:
    (>):
      - |
        rm -r "%{install-root}%{datadir}/applications"
        rm -r "%{install-root}%{sysconfdir}/dbus-1/system.d"
        rm -r "%{install-root}%{libexecdir}"
        rm -r "%{install-root}%{datadir}/dbus-1/system-services"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{datadir}/dbus-1/interfaces/org.freedesktop.GeoClue2*"
          - "%{libdir}/libgeoclue-2.so"

sources:
  - kind: tar
    url: https://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-2.4.12.tar.xz
    ref: 05d0e2ec077a685de2a9c63973fe6d18366ca53881d1f0750110b93c5c68caca
