# This should be removed when using Mesa >=17.3
kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/mesa.bst

variables:
  conf-extra: |
    --disable-tools

config:
  configure-commands:
    (<):
      - |
        ./autogen.sh

sources:
  - kind: git
    url: https://github.com/divVerent/s2tc.git
    track: master
    ref: f6ec862d7594e29ae80a6e49f66ad4c76cf09abc
