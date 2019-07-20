kind: autotools
description: X.org lib Xxf86vm

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXxf86vm.so'
  cpe:
    product: libxf86vm

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxxf86vm.git
  track: master
  ref: libXxf86vm-1.1.4-0-g92d18649e92566ccc3abeba244adabda249cce1b
