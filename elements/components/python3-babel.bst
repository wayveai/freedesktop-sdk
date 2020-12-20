kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-pytz.bst

sources:
- kind: pypi
  name: babel
  url: pypi:41/1b/5ed6e564b9ca54318df20ebe5d642ab25da4118df3c178247b8c4b26fa13/Babel-2.9.0.tar.gz
  sha256sum: da031ab54472314f210b0adcff1588ee5d1d1d0ba4dbd07b94dba82bde791e05
