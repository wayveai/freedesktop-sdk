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
    ref: 005fd3a0c449f809d0128921da8ef6762fecffc9 #  v1.0.0
