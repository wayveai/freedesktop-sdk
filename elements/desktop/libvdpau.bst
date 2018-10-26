kind: autotools
description: libvdpau

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvdpau.so'
        - '%{libdir}/vdpau/libvdpau_*.so'

sources:
- kind: tar
  url: https://people.freedesktop.org/~aplattner/vdpau/libvdpau-1.1.1.tar.bz2
  ref: 857a01932609225b9a3a5bf222b85e39b55c08787d0ad427dbd9ec033d58d736
