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
  url: pypi:cf/79/1a19c2f792da00cbead7b6caa176afdddf517522cb9163ce39576025b050/setuptools-57.1.0.tar.gz
  sha256sum: cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63afddd82d681de4d22a597b
