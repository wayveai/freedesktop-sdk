kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_tag
  url: github:cython/cython.git
  track: 0.29.x
  ref: 0.29.27-0-g229a4531780863c8a5c311d6b3c70a545988f85f
