kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_tag
  url: github:cython/cython.git
  track: 0.29.x
  ref: 0.29.18-0-ga57de922bbcfaa44ca4e7580e69ec9f5b6b62ad4
