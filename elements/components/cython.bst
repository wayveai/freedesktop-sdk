kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  url: pypi:d3/38/adc49a5aca4f644e6322237089fdcf194084f5fe41445e6e632f28b32bf7/Cython-0.29.22.tar.gz
  sha256sum: df6b83c7a6d1d967ea89a2903e4a931377634a297459652e4551734c48195406
