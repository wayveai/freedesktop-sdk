kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-semantic-version.bst
- components/python3-setuptools.bst
- components/python3-typing-extensions.bst

sources:
- kind: pypi
  name: setuptools-rust
  ref:
    sha256sum: 958c5bf4ab6483d59dab888538121871cc5006354a42fb0fbd50acf03caad1de
    suffix: a9/55/5db4a5b137af2afdc23a6e251d5ebb3b4e04c8deb68fbb5ffdacbd134c0c/setuptools-rust-1.3.0.tar.gz
