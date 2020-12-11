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
  ref: 2.7.3-0-gccd14b98092c7189452cfbe825158c434b90b9cc
