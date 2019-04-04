kind: autotools

depends:
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/mesa-headers.bst
  type: build

variables:
  prefix: /app
  lib: lib

sources:
- kind: git_tag
  url: freedesktop:mesa/glu.git
  track: master
  ref: glu-9.0.0-0-g030651b64854b84a01ebebad9af188e7644c541a
