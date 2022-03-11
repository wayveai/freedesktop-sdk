kind: meson
description: libvdpau

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: public-stacks/buildsystem-meson.bst
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
  ref: 1.5-0-g79f1506a3307d3275b0fdfb2e110c173f68e6f78
