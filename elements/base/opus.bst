kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: base/git-minimal.bst
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
