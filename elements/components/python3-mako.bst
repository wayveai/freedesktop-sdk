kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: pypi
  name: mako
  url: pypi:5c/db/2d2d88b924aa4674a080aae83b59ea19d593250bfe5ed789947c21736785/Mako-1.1.4.tar.gz
  sha256sum: 17831f0b7087c313c0ffae2bcbbd3c1d5ba9eeac9c38f2eb7b50e8c99fe9d5ab
