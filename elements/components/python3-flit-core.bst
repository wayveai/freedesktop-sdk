kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

variables:
  command-subdir: flit_core

(@):
- elements/include/flit-source.yml
