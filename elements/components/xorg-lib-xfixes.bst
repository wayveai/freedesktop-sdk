kind: autotools
description: X.org lib xfixes

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXfixes.so'
  cpe:
    product: libxfixes

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxfixes.git
  track: master
  # Tracking limited to version 5 since components/xorg-proto-xorgproto.bst is frozen and a newer version is required
  match:
  - libXfixes-5.*
  ref: libXfixes-5.0.3-0-g84df9cb81cc31bbed27ba241a23ae04f61da57db
