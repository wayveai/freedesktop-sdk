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
  track: main
  ref: 0.37.0-0-gb8c4aa055cea0132776e7e53edce3538710d5b68
