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
  url: pypi:36/2b/61d51a2c4f25ef062ae3f74576b01638bebad5e045f747ff12643df63844/PyYAML-6.0.tar.gz
  sha256sum: 68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2
