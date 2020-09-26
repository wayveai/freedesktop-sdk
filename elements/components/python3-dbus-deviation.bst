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
  url: pypi:1f/c3/0b4ea31404ff0e22e37ae3675687575061836b85bf18866a4a61f181e52f/dbus-deviation-0.6.0.tar.gz
  sha256sum: cfbb3c906807d8376ae598bbc889b3a71992cdecc0637091d97ffcbcb69b7408
