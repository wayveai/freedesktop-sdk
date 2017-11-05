kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/xorg-util-macros.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-proto-kb.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libxkbfile.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libxkbfile-1.0.9.tar.bz2
    ref: 51817e0530961975d9513b773960b4edd275f7d5c72293d5a151ed4f42aeb16a

