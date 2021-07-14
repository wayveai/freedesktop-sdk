kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_tag
  url: github:cython/cython.git
  track: 0.29.x
  ref: 0.29.24-0-g3a34c5fb48ee86be9d0a819fee1ff3cb3efd1a1e
