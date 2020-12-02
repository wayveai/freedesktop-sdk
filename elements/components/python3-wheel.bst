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
  ref: 0.36.0-0-g39b6397ba944d82f1fe37d043382f97b78a919d6
