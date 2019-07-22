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
  ref: font-util-1.3.1-0-gcfe0b4fb8f87b03060a3d3c9538df144856b5e9f
