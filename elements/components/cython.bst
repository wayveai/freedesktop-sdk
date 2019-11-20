kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_tag
  url: github:cython/cython
  track: 0.29.x
  ref: 0.29.14-0-gbfcaf163e3dcf472ef2af5dec6ac3fffd0d34e66
