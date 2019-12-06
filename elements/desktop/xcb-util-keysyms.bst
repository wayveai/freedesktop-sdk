kind: autotools
description: X.org xcb-util-keysyms

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-xcb.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcb-keysyms.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/xcb/xcb-util-keysyms-0.4.0.tar.bz2
  ref: 0ef8490ff1dede52b7de533158547f8b454b241aa3e4dcca369507f66f216dd9
