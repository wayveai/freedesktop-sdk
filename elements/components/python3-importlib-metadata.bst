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
  url: pypi:3f/a8/16dc098b0addd1c20719c18a86e985be851b3ec1e103e703297169bb22cc/importlib_metadata-3.1.1.tar.gz
  sha256sum: b0c2d3b226157ae4517d9625decf63591461c66b3a808c2666d538946519d170
