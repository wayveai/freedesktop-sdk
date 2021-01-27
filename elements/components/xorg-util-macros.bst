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
  ref: util-macros-1.19.3-0-gb8766308d2f78bc572abe5198007cf7aeec9b761
