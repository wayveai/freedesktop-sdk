kind: autotools
description: X.org lib xcb

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-proto-xcb.bst
- filename: desktop/xorg-util-macros.bst
  type: build
- filename: desktop/xorg-lib-xau.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/python3.bst
  type: build

variables:
  conf-local: |
    --enable-xkb \
    --disable-xprint

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-xvmc.so'
        - '%{libdir}/libxcb-res.so'
        - '%{libdir}/libxcb-shm.so'
        - '%{libdir}/libxcb-dri2.so'
        - '%{libdir}/libxcb.so'
        - '%{libdir}/libxcb-composite.so'
        - '%{libdir}/libxcb-sync.so'
        - '%{libdir}/libxcb-screensaver.so'
        - '%{libdir}/libxcb-xtest.so'
        - '%{libdir}/libxcb-glx.so'
        - '%{libdir}/libxcb-record.so'
        - '%{libdir}/libxcb-xv.so'
        - '%{libdir}/libxcb-damage.so'
        - '%{libdir}/libxcb-shape.so'
        - '%{libdir}/libxcb-dpms.so'
        - '%{libdir}/libxcb-xf86dri.so'
        - '%{libdir}/libxcb-render.so'
        - '%{libdir}/libxcb-xfixes.so'
        - '%{libdir}/libxcb-dri3.so'
        - '%{libdir}/libxcb-randr.so'
        - '%{libdir}/libxcb-xinerama.so'
        - '%{libdir}/libxcb-present.so'
        - '%{libdir}/libxcb-xkb.so'
        - '%{libdir}/libxcb-xinput.so'
  cpe:
    product: libxcb

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

sources:
- kind: tar
  url: https://xcb.freedesktop.org/dist/libxcb-1.13.tar.bz2
  ref: 188c8752193c50ff2dbe89db4554c63df2e26a2e47b0fa415a70918b5b851daa
- kind: patch
  path: patches/xorg-lib-xcb-pthread-stub.patch
