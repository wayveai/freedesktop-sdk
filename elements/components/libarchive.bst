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
  ref: v3.4.2-0-g3288ebb0353beb51dfb09d444dedbe9235ead53d
