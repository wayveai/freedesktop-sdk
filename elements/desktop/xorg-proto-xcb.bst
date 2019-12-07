kind: autotools
description: X.org proto xcb

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
  type: build

sources:
- kind: tar
  url: tar_https:xcb.freedesktop.org/dist/xcb-proto-1.13.tar.bz2
  ref: 7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271e47a2fe875e2bde1
