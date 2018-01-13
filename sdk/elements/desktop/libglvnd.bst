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
    ref: e4a1393ffeb19e0eb87abe5aed2fcb066a90475d
