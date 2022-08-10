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
    sha256sum: 0b8aeb814afe0e9d7c31569ec0936d1f5201993530639244fa973e1742005671
    suffix: 20/84/a98f6714ec6aafe3ec2bfa26232af3302453882a1c135f9b518a36275e22/setuptools-rust-1.5.0.tar.gz
