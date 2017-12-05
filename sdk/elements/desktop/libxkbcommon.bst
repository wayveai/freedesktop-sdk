kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-data-xkeyboard-config.bst

variables:
  conf-extra: |
    --enable-x11

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libxkbcommon.so"
          - "%{libdir}/libxkbcommon-x11.so"

sources:
  - kind: tar
    url: https://xkbcommon.org/download/libxkbcommon-0.7.2.tar.xz
    ref: 28a4dc2735863bec2dba238de07fcdff28c5dd2300ae9dfdb47282206cd9b9d8
