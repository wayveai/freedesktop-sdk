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
  ref: v1.19.0-0-g9f486e88597056a61d76364f21b5a911f17e896a
