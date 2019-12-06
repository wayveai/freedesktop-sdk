kind: autotools
description: X.org xcb-util-cursor

depends:
- filename: bootstrap-import.bst
- filename: desktop/xcb-util-renderutil.bst
- filename: desktop/xcb-util-image.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-cursor.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/xcb/xcb-util-cursor-0.1.3.tar.bz2
  ref: 05a10a0706a1a789a078be297b5fb663f66a71fb7f7f1b99658264c35926394f
