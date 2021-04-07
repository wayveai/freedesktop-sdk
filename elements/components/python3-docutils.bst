kind: pip

depends:
- filename: components/python3.bst

build-depends:
- filename: bootstrap-import.bst
- filename: components/python3-pip.bst

sources:
- kind: pypi
  name: docutils
  url: pypi:8e/5a/85e35f8692abd8dcd00a67e79c1e45caa6019b8d49d3bee5b2482583d81d/docutils-0.17.tar.gz
  sha256sum: e2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c
