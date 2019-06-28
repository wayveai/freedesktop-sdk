kind: autotools
description: Multi-format archive and compression library

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
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
  ref: v3.4.0-0-g614110e76d9dbb9ed3e159a71cbd75fa3b23efe3
