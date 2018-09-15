kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/orc"
          - "%{libdir}/liborc-0.4.so"
          - "%{libdir}/liborc-test-0.4.so"

sources:
  - kind: git
    url: freedesktop:gstreamer/orc
    ref: 31cb4bfc51de81b5c2569abdcff830b83c74499c  # 0.4.28

