kind: myautotools

depends:
  - filename: base.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{bindir}/orc"
        - "%{libdir}/liborc-0.4.so"
        - "%{libdir}/liborc-test-0.4.so"

sources:
  - kind: tar
    url: https://gstreamer.freedesktop.org/src/orc/orc-0.4.27.tar.xz
    ref: 51e53e58fc8158e5986a1f1a49a6d970c5b16493841cf7b9de2c2bde7ce36b93

