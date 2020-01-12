kind: autotools
description: Multi-format archive and compression library

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libarchive.so'

sources:
- kind: git_tag
  url: github:libarchive/libarchive.git
  track: master
  ref: v3.4.1-0-gcce09646b566c61c2debff58a70da780b8457883
