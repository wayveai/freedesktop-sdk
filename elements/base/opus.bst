kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/git.bst
    type: build
  - filename: base/libtool.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libopus.so"

sources:
- kind: git
  url: https://git.xiph.org/opus.git
  track: master
  ref: defbc370ec764d3d0dc43c45911e455b5e483b30 #  v1.2.1
