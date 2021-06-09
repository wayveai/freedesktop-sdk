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
  ref: 1.5.8-0-g2a1665c632d47c2c73f4e8e1d2f2db62b26682d2
