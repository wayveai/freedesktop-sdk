kind: myautotools

depends:
  - filename: base-stack.bst
    type: build
  - filename: desktop/dbus.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libatspi.so"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/at-spi2-core/2.26/at-spi2-core-2.26.0.tar.xz
    ref: 511568a65fda11fdd5ba5d4adfd48d5d76810d0e6ba4f7460f1b2ec0dbbbc337
