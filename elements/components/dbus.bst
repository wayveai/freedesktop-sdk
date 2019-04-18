kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/expat.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/python3.bst
  type: build
- filename: components/libsystemd.bst

variables:
  conf-local: |
    --runstatedir=/run \
    --with-system-socket=/run/dbus/system_bus_socket

config:
  install-commands:
    (>):
    - |
      rm -rf %{install-root}%{localstatedir}/run

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdbus-1.so'
  cpe:
    product: d-bus

sources:
- kind: tar
  url: https://dbus.freedesktop.org/releases/dbus/dbus-1.12.8.tar.gz
  ref: e2dc99e7338303393b6663a98320aba6a63421bcdaaf571c8022f815e5896eb3
