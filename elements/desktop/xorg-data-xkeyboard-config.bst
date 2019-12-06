kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-util-macros.bst
  type: build
- filename: desktop/xorg-app-xkbcomp.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/intltool.bst
  type: build

variables:
  conf-local: |
    --enable-compat-rules \
    --with-xkb-base=/usr/share/X11/xkb \
    --with-xkb-rules-symlink=xorg

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/data/xkeyboard-config-2.5.1.tar.bz2
  ref: eb80e8dc38c389728bfca1f041af7658e7dd67faca8c763de02d5014ffd2cc92

