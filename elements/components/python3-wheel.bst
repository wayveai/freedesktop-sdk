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
  ref: 0.37.1-0-gc716c87ffa528ac9a31de3ed3217058848dc2cd2
