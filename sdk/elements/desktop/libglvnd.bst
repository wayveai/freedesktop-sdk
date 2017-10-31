kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: desktop/xorg-proto-gl.bst

variables:
  conf-extra: |
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
