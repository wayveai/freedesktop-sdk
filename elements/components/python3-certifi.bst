kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: git_tag
  url: github:certifi/python-certifi.git
  track: master
  ref: 2019.11.28-0-g21abb9b9bbf4c0cfecf652fadafee3eb9615d553
