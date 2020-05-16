kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build
- filename: components/pkg-config.bst
  type: build
- filename: components/cairo.bst

variables:
  pip: pip3

sources:
- kind: git_tag
  url: github:pygobject/pycairo.git
  track: master
  ref: v1.19.1-0-g43e9c4a83d74a6771ac8f76bb3158f3dcd9af7d2
