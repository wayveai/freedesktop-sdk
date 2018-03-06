kind: autotools
description: X.org lib Xcursor

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-util-macros.bst
  - filename: desktop/xorg-proto-xorgproto.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xrender.bst
  - filename: desktop/xorg-lib-xfixes.bst

variables:
  conf-local: |
    --with-cursorpath=~/.icons:/app/share/icons:%{datadir}/icons:%{datadir}/pixmaps:%{datadir}/runtime/share/icons:/run/host/share/icons

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libXcursor.so"

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXcursor-1.1.15.tar.bz2
    ref: 294e670dd37cd23995e69aae626629d4a2dfe5708851bbc13d032401b7a3df6b
