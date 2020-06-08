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
  ref: 1.4-0-gc3d1a9dbafdfe6144ff474d0d523dc01b068750f
