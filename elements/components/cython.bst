kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_tag
  url: github:cython/cython.git
  track: 0.29.x
  ref: 0.29.32-0-gc48361d0a0969206e227ec016f654c9d941c2b69
