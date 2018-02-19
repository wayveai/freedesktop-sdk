kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-data-xkeyboard-config.bst

variables:
  conf-local: |
    --enable-x11

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libxkbcommon.so"
          - "%{libdir}/libxkbcommon-x11.so"

sources:
  - kind: git
    url: https://github.com/xkbcommon/libxkbcommon.git
    track: master
    ref: ba9568bdb128f3c5f717b8503439ef6e50a66e97 #  xkbcommon-0.7.2
