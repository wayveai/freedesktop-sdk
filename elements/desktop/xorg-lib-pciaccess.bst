kind: autotools
description: X.org lib pciaccess

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpciaccess.so'

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/lib/libpciaccess-0.14.tar.bz2
  ref: 3df543e12afd41fea8eac817e48cbfde5aed8817b81670a4e9e493bb2f5bf2a4
