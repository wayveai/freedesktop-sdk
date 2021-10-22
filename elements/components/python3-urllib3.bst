kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: git_tag
  url: github:urllib3/urllib3.git
  track: main
  ref: 1.25.7-0-g37ba61a8b8120cbd866d057eaa3936f4b140dee0
