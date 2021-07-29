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
  ref: 1.16.0-0-g65486e4383f9f411da95937451205d3c7b61b9e1
