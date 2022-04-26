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
  url: pypi:4e/02/2fc4c83b4f816fdd30f38c0c4837a322d21967f953bb9a51bce91b4511f6/setuptools-rust-1.2.0.tar.gz
  sha256sum: 0a4ada479e8c7e3d8bd7cb56e1a29acc2b2bb98c2325051b0cdcb57d7f056de8
