kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-smartypants.bst

sources:
- kind: pypi
  name: typogrify

