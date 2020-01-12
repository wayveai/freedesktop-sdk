kind: autotools
description: X.org lib xpm

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
        - '%{libdir}/libXpm.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxpm.git
  track: master
  ref: libXpm-3.5.13-0-gb0fc485495a694816d76a43978e2cfd5575c554d
