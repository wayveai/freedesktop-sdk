kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xkbfile.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/xorg-util-macros.bst
  type: build
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build

sources:
- kind: git_tag
  url: freedesktop:xorg/app/xkbcomp.git
  track: master
  ref: xkbcomp-1.4.4-0-g790b998647ec171133bf196a3d84c5153cd64840
