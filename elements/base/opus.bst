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
  ref: 83d5155f151ca47c9d6274ded1a7481f746b9a43 #  v1.3
