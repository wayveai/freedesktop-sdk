kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/libxml2.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libxslt.so"
          - "%{libdir}/libexslt.so"

sources:
  - kind: git
    url: https://gitlab.gnome.org/GNOME/libxslt
    ref: 8307b072adb86c8064897f4c5e12e5ae142f3bff  # 1.1.32
