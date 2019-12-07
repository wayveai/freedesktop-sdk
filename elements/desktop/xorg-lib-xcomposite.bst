kind: autotools
description: X.org lib Xcomposite

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xfixes.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXcomposite.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXcomposite-0.4.4.tar.bz2
  ref: ede250cd207d8bee4a338265c3007d7a68d5aca791b6ac41af18e9a2aeb34178
