kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-sphinx.bst
- components/python3-setuptools-pep8.bst
- components/python3-setuptools-git.bst
- components/python3-six.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: dbus-deviation

