kind: autotools

depends:
  - filename: base/buildsystem-autotools.bst
    type: build
  - filename: desktop/mesa.bst
    type: build

variables:
  prefix: /app
  lib: lib

sources:
  - kind: git
    url: freedesktop:mesa/glu.git
    ref: 030651b64854b84a01ebebad9af188e7644c541a # gl-9.0.0
