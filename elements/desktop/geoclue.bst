kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/json-glib.bst
  - filename: base/glib.bst
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
    url: https://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-2.4.11.tar.xz
    ref: 01397ff7e4acaf0503eacd51aae3d70df0ddc7553bb822f172e4f1409713f31d
