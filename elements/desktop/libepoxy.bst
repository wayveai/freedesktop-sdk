kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/mesa.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: desktop/xorg-util-macros.bst
  type: build
- filename: base/python3.bst
  type: build

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
