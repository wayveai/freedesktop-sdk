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
  url: tar_https:xcb.freedesktop.org/dist/libxcb-1.13.1.tar.bz2
  ref: a89fb7af7a11f43d2ce84a844a4b38df688c092bf4b67683aef179cdf2a647c4
- kind: patch
  path: patches/xorg-lib-xcb/xorg-lib-xcb-pthread-stub.patch
