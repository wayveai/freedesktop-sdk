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
  ref: xkbcomp-1.4.3-0-gd373c9b434c603bf6a5eb442b6427992d23ef874
