kind: autotools
description: X.org lib xdamage

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-xfixes.bst
- filename: desktop/xorg-lib-x11.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXdamage.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libXdamage-1.1.4.tar.bz2
  ref: 7c3fe7c657e83547f4822bfde30a90d84524efb56365448768409b77f05355ad
