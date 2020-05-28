kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: git_tag
  url: github:benjaminp/six.git
  track: master
  ref: 1.15.0-0-gc0be8815d13df45b6ae471c4c436cce8c192245d
