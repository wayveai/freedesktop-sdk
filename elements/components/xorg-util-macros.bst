kind: autotools
description: X.org util macros

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
      - /**

sources:
- kind: git_tag
  url: freedesktop:xorg/util/macros.git
  track: master
  ref: util-macros-1.19.2-0-g771b773b50717884b37f6b2473166b4be4670076
