kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/mesa.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/python3.bst
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
  url: https://github.com/anholt/libepoxy/
  track: master
  ref: 707f50e680ab4f1861b1e54ca6e2907aaca56c12   # 1.5.2
