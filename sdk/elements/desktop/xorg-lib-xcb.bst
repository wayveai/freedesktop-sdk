kind: myautotools
description: X.org lib xcb

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-proto-xcb.bst
  - filename: desktop/xorg-util-macros.bst
  - filename: desktop/xorg-lib-xau.bst
  - filename: desktop/xorg-lib-pthread-stubs.bst

variables:
  conf-extra: |
    --enable-xkb \
    --disable-xprint

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libxcb-xvmc.so"
          - "%{libdir}/libxcb-res.so"
          - "%{libdir}/libxcb-shm.so"
          - "%{libdir}/libxcb-dri2.so"
          - "%{libdir}/libxcb.so"
          - "%{libdir}/libxcb-composite.so"
          - "%{libdir}/libxcb-sync.so"
          - "%{libdir}/libxcb-screensaver.so"
          - "%{libdir}/libxcb-xtest.so"
          - "%{libdir}/libxcb-glx.so"
          - "%{libdir}/libxcb-record.so"
          - "%{libdir}/libxcb-xv.so"
          - "%{libdir}/libxcb-damage.so"
          - "%{libdir}/libxcb-shape.so"
          - "%{libdir}/libxcb-dpms.so"
          - "%{libdir}/libxcb-xf86dri.so"
          - "%{libdir}/libxcb-render.so"
          - "%{libdir}/libxcb-xfixes.so"
          - "%{libdir}/libxcb-dri3.so"
          - "%{libdir}/libxcb-randr.so"
          - "%{libdir}/libxcb-xinerama.so"
          - "%{libdir}/libxcb-present.so"
          - "%{libdir}/libxcb-xkb.so"

sources:
  - kind: tar
    url: https://xcb.freedesktop.org/dist/libxcb-1.12.tar.bz2
    ref: 4adfb1b7c67e99bc9c2ccb110b2f175686576d2f792c8a71b9c8b19014057b5b
