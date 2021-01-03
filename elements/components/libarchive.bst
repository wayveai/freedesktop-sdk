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
  match:
  - v3.4.*
  ref: v3.4.3-0-gfc6563f5130d8a7ee1fc27c0e55baef35119f26c
