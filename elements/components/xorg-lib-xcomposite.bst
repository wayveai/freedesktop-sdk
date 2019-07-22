kind: autotools
description: X.org lib Xcomposite

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xfixes.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libXcomposite.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcomposite.git
  track: master
  ref: libXcomposite-0.4.5-0-gfd7d02cc014ac9bf5bb7e68b66102ea36a76a59a
