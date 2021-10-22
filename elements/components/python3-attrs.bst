kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: git_tag
  url: github:python-attrs/attrs.git
  track: main
  ref: 19.3.0-0-g823c1c332ce7de24eef8a28e6d9ccf818ce7746c
