kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: desktop/xorg-proto-xorgproto.bst

variables:
  conf-local: |
    --enable-asm \
    --enable-tls

config:
  configure-commands:
    (<):
      - |
        ./autogen.sh

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libGLdispatch.so"
          - "%{libdir}/libGLESv1_CM.so"
          - "%{libdir}/libOpenGL.so"
          - "%{libdir}/libEGL.so"
          - "%{libdir}/libGL.so"
          - "%{libdir}/libGLX.so"
          - "%{libdir}/libGLESv2.so"

sources:
  - kind: git
    url: https://github.com/NVIDIA/libglvnd.git
    track: master
    ref: e4a1393ffeb19e0eb87abe5aed2fcb066a90475d
