kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/python2.bst
  type: build

variables:
  conf-local: |
    --enable-asm \
    --enable-tls

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libGLdispatch.so'
        - '%{libdir}/libGLESv1_CM.so'
        - '%{libdir}/libOpenGL.so'
        - '%{libdir}/libEGL.so'
        - '%{libdir}/libGL.so'
        - '%{libdir}/libGLX.so'
        - '%{libdir}/libGLESv2.so'

sources:
- kind: git_tag
  url: https://github.com/NVIDIA/libglvnd.git
  track: master
  ref: v1.1.0-0-g59dbb141a610fed12735a0abc897daf649d39b22
