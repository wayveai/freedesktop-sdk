kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/python3.bst
  type: build

variables:
  conf-local: |
    --enable-asm \
    --enable-tls \
    CFLAGS="$CFLAGS -UDEFAULT_EGL_VENDOR_CONFIG_DIRS -DDEFAULT_EGL_VENDOR_CONFIG_DIRS=\\\"%{libdir}/GL/glvnd/egl_vendor.d\\\""

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
  url: github:NVIDIA/libglvnd.git
  track: master
  ref: v1.1.1-0-gbc9990b7bede44899627354d0c356f48950f4ad1
