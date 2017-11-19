kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/json-glib.bst
  - filename: desktop/libsoup.bst

variables:
  conf-extra: |
    --disable-3g-source \
    --disable-cdma-source \
    --disable-modem-gps-source \
    --disable-nmea-source

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
    url: https://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-2.4.7.tar.xz
    ref: d17b96bb5799a84723385ea5704235565e9c3dedd2b7afac475a06e550ae0ea6
