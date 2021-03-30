kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

config:
  configure-commands:
    (<):
    - |
      python3 bootstrap.py

sources:
- kind: pypi
  name: setuptools
  url: pypi:94/75/05e1d69c61c4dfaf65ad12785cd18bedc1e0129976c55914d6aea59c7da8/setuptools-54.2.0.tar.gz
  sha256sum: aa9c24fb83a9116b8d425e53bec24c7bfdbffc313c2159f9ed036d4a6dd32d7d
