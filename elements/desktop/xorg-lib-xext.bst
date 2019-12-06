kind: autotools
description: X.org lib xext

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXext.so'
  cpe:
    product: libxext

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXext-1.3.3.tar.bz2
  ref: b518d4d332231f313371fdefac59e3776f4f0823bcb23cf7c7305bfb57b16e35
