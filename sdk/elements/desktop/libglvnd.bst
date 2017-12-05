kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: desktop/xorg-proto-gl.bst

variables:
  conf-local: |
    --enable-asm \
    --enable-tls

config:
  configure-commands:
    (<):
      - |
        ./autogen.sh

sources:
  - kind: git
    url: https://github.com/NVIDIA/libglvnd.git
    track: master
    ref: e202ebf27f5783400fa12b33ed18bb3599ec98ed
