kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst
- components/python3-zipp.bst

sources:
- kind: pypi
  name: importlib-metadata
  url: pypi:85/0e/faec12e1c81ac13394e7df7a578e3177a58bab80b6abce92bfa558cc210e/importlib_metadata-3.7.0.tar.gz
  sha256sum: 24499ffde1b80be08284100393955842be4a59c7c16bbf2738aad0e464a8e0aa
