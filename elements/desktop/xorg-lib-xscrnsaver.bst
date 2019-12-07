kind: autotools
description: X.org lib XScrnSaver

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXss.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXScrnSaver-1.2.3.tar.bz2
  ref: f917075a1b7b5a38d67a8b0238eaab14acd2557679835b154cf2bca576e89bf8
