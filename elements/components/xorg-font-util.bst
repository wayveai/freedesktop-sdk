kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/font/util.git
  track: master
  ref: font-util-1.3.2-0-gd45011b8324fecebb4fc79e57491d341dd96e325
