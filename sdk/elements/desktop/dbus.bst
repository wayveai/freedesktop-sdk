kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/expat.bst
  - filename: base/pkg-config.bst
    type: build

public:
  bst:
    integration-commands:
      - |
        dbus-uuidgen --ensure
    split-rules:
      devel:
        (>):
          - "%{libdir}/libdbus-1.so"

sources:
  - kind: tar
    url: https://dbus.freedesktop.org/releases/dbus/dbus-1.12.2.tar.gz
    ref: 272bb5091770b047c8188b926d5e6038fa4fe6745488b2add96b23e2d9a83d88
