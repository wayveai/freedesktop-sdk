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
  url: pypi:50/05/fef7fbb7e781e0632ebba4e6e37bcc88b9615e76338850dc31435091ddc0/importlib_metadata-4.10.0.tar.gz
  sha256sum: 92a8b58ce734b2a4494878e0ecf7d79ccd7a128b5fc6014c401e0b61f006f0f6
