kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  url: pypi:18/3d/82769bc929807a11e455265a402c9012a31dacd72a1b85795f337bb0c3fe/filelock-3.2.0.tar.gz
  sha256sum: 85ecb30757aa19d06bfcdad29cc332b9a3e4851bf59976aea1e8dadcbd9ef883
