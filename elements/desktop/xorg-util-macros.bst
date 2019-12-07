kind: autotools
description: X.org util macros

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
      - /**

sources:
- kind: tar
  url: tar_https:www.x.org/archive/individual/util/util-macros-1.19.2.tar.bz2
  ref: d7e43376ad220411499a79735020f9d145fdc159284867e99467e0d771f3e712

