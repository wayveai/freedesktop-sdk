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
  ref: libXfont2-2.0.3-0-gcdb2f990348c3bd1407022f7e0e5fcba552d539f
