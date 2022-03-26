kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:e5/5a/ed1104ccc8d798a22560be48ee93d3f1139418a8e4bb9603c7965b185486/importlib_resources-5.6.0.tar.gz
  sha256sum: 1b93238cbf23b4cde34240dd8321d99e9bf2eb4bc91c0c99b2886283e7baad85
