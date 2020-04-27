kind: autotools

depends:
- bootstrap-import.bst
- components/glib.bst
- components/dbus.bst
- components/libical.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst

variables:
  conf-local: >-
    --enable-library

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libbluetooth.so'

(@): elements/include/bluez.yml
