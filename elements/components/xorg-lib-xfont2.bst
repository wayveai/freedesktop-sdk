kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/freetype.bst
- filename: components/xorg-lib-fontenc.bst
- filename: components/xorg-util-macros.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxfont.git
  track: master
  ref: libXfont2-2.0.5-0-g3a4f68284c5aeea77789af1fe395cac35efc8562
