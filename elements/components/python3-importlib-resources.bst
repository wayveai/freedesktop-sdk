kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:c8/b2/d8263caf10de8632ef6756991d52e7fb0d8f5aa1e473344fad79b19ccb23/importlib_resources-5.1.2.tar.gz
  sha256sum: 642586fc4740bd1cad7690f836b3321309402b20b332529f25617ff18e8e1370
