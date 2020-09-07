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
  ref: 0.35.1-0-gbbc60829bea2eb25ccd236b9c6c16c9ee4f0d2ef
