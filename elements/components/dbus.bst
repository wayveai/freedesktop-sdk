kind: autotools

depends:
- bootstrap-import.bst
- components/expat.bst
- components/systemd-libs.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3.bst
- components/systemd.bst

variables:
  conf-local: >-
    runstatedir=/run
    --with-system-socket=/run/dbus/system_bus_socket
    --enable-user-session

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
        - '%{libdir}/dbus-1.0/include'
        - '%{libdir}/dbus-1.0/include/**'
      (@): include/_private/exclude-systemd.yml


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
  ref: dbus-1.12.16-0-g23cc709db8fab94f11fa48772bff396b20aea8b0
