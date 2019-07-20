kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-proto-xorgproto.bst
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/xorg-font-util.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libfontenc.git
  track: master
  ref: libfontenc-1.1.4-0-g2baea13978759d1a011fc6d739465893b554d30a
