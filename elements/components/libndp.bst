kind: autotools
depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: github:jpirko/libndp.git
  track: master

  ref: v1.7-0-g96674e7d4f4d569c2c961e865cc16152dfab5f09
