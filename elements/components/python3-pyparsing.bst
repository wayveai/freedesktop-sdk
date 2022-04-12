kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-flit-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyparsing
  url: pypi:31/df/789bd0556e65cf931a5b87b603fcf02f79ff04d5379f3063588faaf9c1e4/pyparsing-3.0.8.tar.gz
  sha256sum: 7bf433498c016c4314268d95df76c81b842a4cb2b276fa3312cfb1e1d85f6954
