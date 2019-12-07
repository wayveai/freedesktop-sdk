kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/expat.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: desktop/libsystemd.bst

variables:
  conf-local: |
    --runstatedir=/run \
    --with-system-socket=/run/dbus/system_bus_socket

config:
  install-commands:
    (>):
    - |
      rm -rf %{install-root}%{localstatedir}/run

    # TODO: replace with --disable-traditional-activation
    # https://gitlab.freedesktop.org/dbus/dbus/commit/94b5b236aa0743bacb2139c62d5a6e0143845634
    - |
      rm %{install-root}%{libexecdir}/dbus-daemon-launch-helper

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
  url: tar_https:dbus.freedesktop.org/releases/dbus/dbus-1.12.8.tar.gz
  ref: e2dc99e7338303393b6663a98320aba6a63421bcdaaf571c8022f815e5896eb3
