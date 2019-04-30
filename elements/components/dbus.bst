kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/expat.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/python3.bst
  type: build
- filename: components/libsystemd.bst
- filename: components/which.bst
  type: build

variables:
  conf-local: |
    runstatedir=/run \
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
- kind: git_tag
  url: freedesktop:dbus/dbus.git
  track: master
  track-extra:
  - dbus-1.12
  match:
  - dbus-[0-9].*[02468].*[02468]
  ref: dbus-1.12.12-0-gd4f8423bbff9b3c5fca2d8009c28d1cff4652788
