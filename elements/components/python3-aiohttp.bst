kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/cython.bst
- components/python3-wheel.bst

runtime-depends:
- components/python3-async-timeout.bst
- components/python3-attrs.bst
- components/python3-chardet.bst
- components/python3-multidict.bst
- components/python3-yarl.bst

sources:
- kind: pypi
  name: aiohttp

