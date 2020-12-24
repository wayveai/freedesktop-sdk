kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/mesa-headers.bst
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/python3.bst
  type: build

variables:
  meson-local: >
    -Ddocs=false
    -Dglx=yes
    -Degl=yes
    -Dx11=true
    -Dtests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libepoxy.so'

sources:
- kind: git_tag
  url: github:anholt/libepoxy.git
  track: master
  ref: 1.5.5-0-g34ecb908b044446226f4cf8829419664ae0ca544
