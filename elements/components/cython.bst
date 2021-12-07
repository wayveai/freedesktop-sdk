kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  url: pypi:09/45/10c39337ba73c38a798165f97e4798827a532eaac71071842cbe0ee13dc5/Cython-0.29.25.tar.gz
  sha256sum: a87cbe3756e7c464acf3e9420d8741e62d3b2eace0846cb39f664ad378aab284
