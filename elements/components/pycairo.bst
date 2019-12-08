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
  ref: v1.18.1-0-g523e679c1bc85354a08352ba0d8d4d9968f21c01
