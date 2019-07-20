kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xrender.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXrandr.so'
  cpe:
    product: libxrandr

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxrandr.git
  track: master
  ref: libXrandr-1.5.2-0-g55dcda4518eda8ae03ef25ea29d3c994ad71eb0a
