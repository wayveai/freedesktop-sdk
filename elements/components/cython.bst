kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: git_tag
  url: github:cython/cython.git
  track: 0.29.x
  ref: 0.29.22-0-g3e470fcc3a4e9a33b66d5db6ab761c773888a1ea
