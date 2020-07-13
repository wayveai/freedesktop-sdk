kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: git_tag
  url: github:pygments/pygments.git
  track: master
  ref: 2.6.1-0-gd2eae8580d7e363bca03554e3b516d0fd77b25cb
