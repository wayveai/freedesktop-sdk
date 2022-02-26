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
  ref: v3.6.0-0-g9147def1da7ad1bdd47b3559eb1bfeeb0e0f374b
- kind: patch
  path: patches/libarchive/autoconf-fix.patch
