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
  local_flags: >-
    -UDEFAULT_EGL_VENDOR_CONFIG_DIRS
    -DDEFAULT_EGL_VENDOR_CONFIG_DIRS=\"%{libdir}/GL/glvnd/egl_vendor.d\"

  conf-local: |
    --enable-asm \
    --enable-tls

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{includedir}/GLES"
      rm "%{install-root}%{libdir}/pkgconfig/glesv1_cm.pc"
      rm "%{install-root}%{libdir}"/libGLESv1_CM.so*

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libGLdispatch.so'
        - '%{libdir}/libOpenGL.so'
        - '%{libdir}/libEGL.so'
        - '%{libdir}/libGL.so'
        - '%{libdir}/libGLX.so'
        - '%{libdir}/libGLESv2.so'

sources:
- kind: git_tag
  url: github:NVIDIA/libglvnd.git
  track: master
  ref: v1.2.0-0-g062a42ea55a9452bfcfe6268348a82edbea7542c
