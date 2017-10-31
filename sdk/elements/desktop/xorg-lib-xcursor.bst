kind: myautotools
description: X.org lib Xcursor

depends:
  - filename: base-stack.bst
  - filename: desktop/xorg-util-macros.bst
  - filename: desktop/xorg-proto-fixes.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xrender.bst
  - filename: desktop/xorg-lib-xfixes.bst

variables:
  conf-extra: |
    --with-cursorpath=~/.icons:/app/share/icons:%{datadir}/icons:%{datadir}/pixmaps:%{datadir}/runtime/share/icons:/run/host/share/icons

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/lib/libXcursor-1.1.14.tar.bz2
    ref: 9bc6acb21ca14da51bda5bc912c8955bc6e5e433f0ab00c5e8bef842596c33df
