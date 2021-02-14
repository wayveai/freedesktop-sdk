kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/cython.bst

depends:
- components/python3.bst
- components/libyaml.bst

sources:
- kind: pypi
  name: pyyaml
  url: pypi:a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d/PyYAML-5.4.1.tar.gz
  sha256sum: 607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e
