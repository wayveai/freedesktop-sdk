kind: myautotools

depends:
  - filename: base.bst
    type: build

variables:
  conf-local: |
      --disable-documentation

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/wayland-scanner"
          - "%{libdir}/libwayland-cursor.so"
          - "%{libdir}/libwayland-server.so"
          - "%{libdir}/libwayland-client.so"

sources:
  - kind: tar
    url: https://wayland.freedesktop.org/releases/wayland-1.14.0.tar.xz
    ref: ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe2b812f008da27ab8

