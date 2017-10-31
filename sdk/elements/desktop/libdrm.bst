kind: myautotools
description: libdrm

depends:
  - filename: base-stack.bst
  - filename: desktop/xorg-lib-pciaccess.bst

variables:
  conf-extra: |
    --disable-udev

sources:
  - kind: tar
    url: https://dri.freedesktop.org/libdrm/libdrm-2.4.85.tar.bz2
    ref: 64e4cd87eaee38ae60b2984ef02b66159b9bdd33030040db2a04339cf15f6173
