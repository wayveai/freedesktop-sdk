kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: git_tag
  url: github:chardet/chardet.git
  track: master
  ref: 3.0.4-0-g9b8c5c2fb118d76c6beeab9affd01c332732a530
