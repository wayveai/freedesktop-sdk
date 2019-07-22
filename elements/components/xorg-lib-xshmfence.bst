kind: autotools
description: X.org lib xshmfence

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-proto-xorgproto.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxshmfence.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxshmfence.git
  track: master
  ref: libxshmfence-1.3-0-gf38b2e73071ba516127f8f5ae47f48df58dc9d53
