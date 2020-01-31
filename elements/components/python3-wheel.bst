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
  ref: 0.34.2-0-g0036f80513457a95a309c81d8a63f113b52dbafa
