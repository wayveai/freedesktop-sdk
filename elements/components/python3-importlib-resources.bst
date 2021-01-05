kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: importlib-resources
  url: pypi:d5/a4/5bdb4e6bb53192ef580fa851be2e7c263d62f3a39ee2f964d5b832c022cf/importlib_resources-4.1.1.tar.gz
  sha256sum: 6b45007a479c4ec21165ae3ffbe37faf35404e2041fac6ae1da684f38530ca73
