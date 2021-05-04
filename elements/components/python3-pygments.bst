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
  ref: 2.9.0-0-g2c0ca2ecaf184c6e887ea4912a6a5302cfa1c6c8
