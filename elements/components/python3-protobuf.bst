kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/protobuf-base.bst

variables:
  command-subdir: python

(@):
- elements/include/protobuf-source.yml
