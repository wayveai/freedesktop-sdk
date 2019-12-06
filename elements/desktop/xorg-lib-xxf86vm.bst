kind: autotools
description: X.org lib Xxf86vm

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
        - '%{libdir}/libXxf86vm.so'
  cpe:
    product: libxf86vm

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXxf86vm-1.1.4.tar.bz2
  ref: afee27f93c5f31c0ad582852c0fb36d50e4de7cd585fcf655e278a633d85cd57
