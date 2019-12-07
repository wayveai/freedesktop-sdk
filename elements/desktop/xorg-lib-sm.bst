kind: autotools
description: X.org lib SM

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-ice.bst
- filename: desktop/xorg-lib-xtrans.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSM.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libSM-1.2.2.tar.bz2
  ref: 0baca8c9f5d934450a70896c4ad38d06475521255ca63b717a6510fdb6e287bd
