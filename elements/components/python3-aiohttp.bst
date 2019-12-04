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
- kind: git_tag
  url: github:aio-libs/aiohttp.git
  track: '3.6'
  submodules:
    vendor/http-parser:
      checkout: true
      url: github:nodejs/http-parser.git
  ref: v3.6.2-0-g6a5ab96bd9cb404b4abfd5160fe8f34a29d941e5
