kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-contextlib2.bst

sources:
- kind: pypi
  name: schema
  url: pypi:c2/13/7332387fabc217b04ce7c4a3286fd1049444991b44cd8f143354e7f8f1fd/schema-0.7.3.tar.gz
  sha256sum: 4cf529318cfd1e844ecbe02f41f7e5aa027463e7403666a52746f31f04f47a5e
