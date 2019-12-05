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
- kind: git_tag
  url: freedesktop:vdpau/libvdpau.git
  track: master
  ref: libvdpau-1.2-0-geac1393480bc7c2209d4984819951cb9dc1e03d0
