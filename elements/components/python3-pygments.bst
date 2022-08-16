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
  ref: 2.13.0-0-gba0d5f528c6c156d1611e5248b7c66c4f23b63a7
