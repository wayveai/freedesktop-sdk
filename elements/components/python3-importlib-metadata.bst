kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  url: pypi:b2/3a/a4d445f71c7370c2df6988a52738d91865074615eb4f549280b765cf8c47/importlib_metadata-3.9.0.tar.gz
  sha256sum: 036eae7ebbd41db176774c42e80f3288a1e41c7ebfc8ed099a94653973ebd00f
