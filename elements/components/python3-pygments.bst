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
  ref: 2.7.0-0-ga7bb6e6dd996313a9aa81d0686ec4734ed35274f
