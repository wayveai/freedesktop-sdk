kind: filter

build-depends:
- components/avahi-base.bst

runtime-depends:
- bootstrap-import.bst
- components/glib.bst
- components/systemd.bst

- components/libdaemon.bst
- components/pygobject.bst
- components/python3-dbus.bst
- components/xmltoman.bst

- components/avahi-manifest.bst

config:
  exclude:
  - ui
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libavahi-client.so"
        - "%{libdir}/libavahi-common.so"
        - "%{libdir}/libavahi-core.so"
        - "%{libdir}/libavahi-glib.so"
        - "%{libdir}/libavahi-gobject.so"
