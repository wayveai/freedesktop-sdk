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
  url: freedesktop:vdpau/libvdpau
  track: master
  ref: 1.3-0-gf57a9904c43ef5d726320c77baa91d0c38361ed4
