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
  url: pypi:d5/e7/b716bf428edb23df5b04a15ac1c2c1acbae8bca3a84991805261f6f47577/importlib_metadata-4.7.1.tar.gz
  sha256sum: c4eb3dec5f697682e383a39701a7de11cd5c02daf8dd93534b69e3e6473f6b1b
