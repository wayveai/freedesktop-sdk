kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: git_tag
  url: github:pypa/wheel.git
  track: master
  ref: 0.36.1-0-g64550e15fdbc96d5690dc872257edc859c218068
